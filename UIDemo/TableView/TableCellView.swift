//
//  TableCellView.swift
//  UIDemo
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import AppKit

class TableCellView: NSTableCellView {
    
    static var identifier =  "TableCell"
    
    var profileImage = NSImageView()
    var label = NSTextField(labelWithString: "")
    
    override init(frame frameRect: NSRect) {
        
        super.init(frame: frameRect)
        addSubview(profileImage)
        addSubview(label)
        profileImage.wantsLayer = true
        profileImage.animates = true
        profileImage.layer?.cornerRadius = 45
        label.isEditable = false
        label.alignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            profileImage.widthAnchor.constraint(equalToConstant: 90),
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            profileImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





