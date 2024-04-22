//
//  demo.swift
//  UIDemo
//
//  Created by raja-16327 on 21/03/23.
//

import Foundation
import Cocoa
import AppKit

class ViewController: NSViewController {

    var table = NSTableView()
    var scrollView = NSScrollView()
    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 600, height: 600))
    }

    func makeScrollView() {
        scrollView.backgroundColor = .black
        scrollView.drawsBackground = true
        scrollView.borderType = .bezelBorder
        scrollView.hasHorizontalScroller = true
        scrollView.hasVerticalScroller = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let scrollViewConstraints = [
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: 0.75)
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
    }

    override func viewDidLoad() {
        makeScrollView()

        table.backgroundColor = .linkColor
        table.delegate = self
        table.dataSource = self
        table.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        table.gridColor = .white
        table.gridStyleMask = [.solidVerticalGridLineMask,.solidHorizontalGridLineMask]
        for i in 1...5 {
            let identifier = NSUserInterfaceItemIdentifier(rawValue: String(i))
            let column = NSTableColumn(identifier: identifier)
            column.title = "Column "+String(i)
            column.sizeToFit()
            table.addTableColumn(column)
        }
        scrollView.documentView = table

    }

}


extension ViewController: NSTableViewDataSource,NSTableViewDelegate {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cell"), owner: self) as? NSTableCellView else {
            let cell =  NSTextField(labelWithString: "Hello" )
            return cell
        }
        return cell
    }
}

