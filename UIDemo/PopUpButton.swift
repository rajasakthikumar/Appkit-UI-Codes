//
//  PopUpButton.swift
//  UIDemo
//
//  Created by raja-16327 on 02/04/23.
//

import Foundation
import AppKit

class PopUpButton: NSView {
    
    var popUpButton: NSPopUpButton!
    
  
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        popUpButton = NSPopUpButton(frame: NSRect(x: 700, y: 500, width: 100, height: 200))
        
        popUpButton.addItem(withTitle: "Option 1")
        popUpButton.addItem(withTitle: "Option 2")
        popUpButton.addItem(withTitle: "Option 3")
        addSubview(popUpButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func optionSelected(_ sender: NSMenuItem) {
        print("Selected option: \(sender.title)")
    }
}
