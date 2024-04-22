//
//  CollectionViewCell.swift
//  UIDemo
//
//  Created by raja-16327 on 29/03/23.
//

import Foundation
import AppKit


class CellView: NSCollectionViewItem {

    static let identifier = "collectionCell"
    var image =  NSImageView()

    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        view = NSView()
        view.wantsLayer = true
        view.layer?.cornerRadius = 9
        addimageView()
    }
    
    func addimageView() {
        
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [image.leftAnchor.constraint(equalTo: view.leftAnchor),
             image.topAnchor.constraint(equalTo: view.topAnchor),
             image.rightAnchor.constraint(equalTo: view.rightAnchor),
             image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("Reusing")
    }
}

