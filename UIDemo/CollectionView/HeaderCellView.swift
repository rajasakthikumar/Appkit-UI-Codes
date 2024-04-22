//
//  HeaderCellView.swift
//  UIDemo
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import AppKit


class HeaderCellView: NSView {
    
    static let identifier = "HeaderView"
    
    let label = NSTextField(labelWithString: "Section")
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        
        // Add the label to the view
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.alignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold, width: .standard)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
