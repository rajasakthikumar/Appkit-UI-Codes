//
//  ViewController.swift
//  UIDemo
//
//  Created by raja-16327 on 18/03/23.
//

import AppKit
import Foundation

class TableView: NSView {
    
    let scrollView = NSScrollView()
    let tableView = NSTableView()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: NSRect())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var wantsUpdateLayer: Bool {
        return true
    }
    
    override func updateLayer() {
        setScrollView()
        setTableView()
        
    }
    
    func setScrollView() {
        scrollView.backgroundColor = .black
        scrollView.drawsBackground = true
        scrollView.borderType = .bezelBorder
        scrollView.hasVerticalScroller = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        
        let scrollViewConstraints = [
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: centerYAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
        ]
        scrollView.frame = tableView.bounds
        NSLayoutConstraint.activate(scrollViewConstraints)
        }
    
    
    
    func setTableView() {
        
        tableView.backgroundColor = .systemPink
        tableView.gridColor = NSColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        tableView.gridStyleMask = .solidHorizontalGridLineMask
        //        tableView.intercellSpacing = NSSize(width: 20, height: 20)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 130
        tableView.registerForDraggedTypes([NSPasteboard.PasteboardType(rawValue: "v.tablecellview")])
        
        scrollView.documentView = tableView
        addSubview(scrollView)
        let identifier = NSUserInterfaceItemIdentifier(rawValue: String(1))
        let column = NSTableColumn(identifier: identifier)
        column.title = "Contacts"
        tableView.addTableColumn(column)
    }
}


extension TableView: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        print(row)
        
        // reuse cell
        
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: TableCellView.identifier), owner: self) as? TableCellView else {
            let cell =  TableCellView()
            cell.profileImage.image = NSImage(named: "boy")
            cell.identifier = NSUserInterfaceItemIdentifier(TableCellView.identifier)
            cell.label.stringValue = "BOY"
            return cell
        }
        cell.profileImage.image = NSImage(named: "girl")
        cell.label.stringValue = "GIRL"
        return cell
    }
    
    
    func tableView(_ tableView: NSTableView, rowActionsForRow row: Int, edge: NSTableView.RowActionEdge) -> [NSTableViewRowAction] {
        if edge == .trailing {
            return [] }

        let deleteAction = NSTableViewRowAction(style: .destructive, title: "Delete") { _,_ in
            tableView.removeRows(at: IndexSet(integer: row), withAnimation: .effectFade)
        }
        deleteAction.backgroundColor = .black
    
        return [deleteAction]
    }
    
    func tableView(_ tableView: NSTableView, pasteboardWriterForRow row: Int) -> NSPasteboardWriting? {
        print("Writer")
           let pasteboardItem = NSPasteboardItem()
           pasteboardItem.setString(String(row), forType: NSPasteboard.PasteboardType(rawValue: "v.tablecellview"))
           return pasteboardItem
       }
       
       func tableView(_ tableView: NSTableView, validateDrop info: NSDraggingInfo, proposedRow row: Int, proposedDropOperation dropOperation: NSTableView.DropOperation) -> NSDragOperation {
           
           print("validate Drop")
           if dropOperation == .on {
               return .move
           } else {
               return []
           }
       }
       
       func tableView(_ tableView: NSTableView, acceptDrop info: NSDraggingInfo, row: Int, dropOperation: NSTableView.DropOperation) -> Bool {
           print("accepdrop")
           guard let data = info.draggingPasteboard.string(forType: NSPasteboard.PasteboardType(rawValue: "v.tablecellview")),
                 let sourceRow = Int(data) else {
               return false
           }
           
           tableView.beginUpdates()
           if sourceRow < row {
               print(sourceRow,row)
               tableView.moveRow(at: sourceRow, to: row - 1)
           } else {
               print(sourceRow,row)
               tableView.moveRow(at: sourceRow, to: row)
           }
           tableView.endUpdates()
           
           return true
       }
}


extension TableView: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        10
    }
}
