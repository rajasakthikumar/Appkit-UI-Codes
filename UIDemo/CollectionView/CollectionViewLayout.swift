//
//  collectionView.swift
//  UIDemo
//
//  Created by raja-16327 on 29/03/23.
//

import Foundation
import AppKit

class CollectionView: NSView {
    
    var collectionView: NSCollectionView
    var scrollView: NSScrollView
    var layout: NSCollectionViewFlowLayout
    
    init() {
        
        collectionView = NSCollectionView()
        scrollView = NSScrollView()
        layout = NSCollectionViewFlowLayout()
        super.init(frame: NSRect())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//   MARK: for dynamic size
//   override func viewDidEndLiveResize() {
//        print(self.bounds)
//        layout.itemSize = NSSize(width: self.bounds.width/4, height: self.bounds.height/4)
//    }

    
    override func viewDidMoveToSuperview() {
        layer?.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        layout.sectionInset = NSEdgeInsets(top: 30, left: 10, bottom: 30, right: 10 )
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColors = [NSColor.black]
        scrollView.documentView = collectionView
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        
    
        NSLayoutConstraint.activate( [
                    scrollView.leftAnchor.constraint(equalTo: leftAnchor),
                    scrollView.topAnchor.constraint(equalTo: topAnchor),
                    scrollView.rightAnchor.constraint(equalTo: rightAnchor),
                    scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                ])
        
        collectionView.register(CellView.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(CellView.identifier))
        
        collectionView.register(HeaderCellView.self, forSupplementaryViewOfKind: NSCollectionView.elementKindSectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(HeaderCellView.identifier))
        
    }
}



extension CollectionView: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return imagesSection1.count
        }
        else {
            return imagesSection2.count
        }
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        7
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        NSSize(width: 0, height: 30)
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        print("Section: \(indexPath.section);Row: \(indexPath.item)")
        
        // reuse cell
        
        let cell = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(CellView.identifier), for: indexPath) as! CellView
        
        if indexPath.section == 0 {
            cell.image.image = NSImage(named: imagesSection1[indexPath.item])
            cell.identifier = NSUserInterfaceItemIdentifier(CellView.identifier)
            return cell
            
        } else {
            cell.image.image = NSImage(named: imagesSection2[indexPath.item])
            cell.identifier = NSUserInterfaceItemIdentifier(CellView.identifier)
            return cell
        }
    }
}


extension CollectionView: NSCollectionViewDelegateFlowLayout, NSCollectionViewDelegate {

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        if indexPath.section == 0 {
            return NSSize(width: 200, height: 450)
        }
        else {
            return NSSize(width: 450, height: 300)
        }
    }
    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> NSView {
        
        let view = collectionView.makeSupplementaryView(ofKind: NSCollectionView.elementKindSectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(HeaderCellView.identifier), for: indexPath) as? HeaderCellView
           view?.label.stringValue = "Section \(indexPath.section+1)"
        view?.layer?.backgroundColor = .white
        
        return view!
    }
}
