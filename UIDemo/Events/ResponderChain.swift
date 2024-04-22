//
//  File.swift
//  UIDemo
//
//  Created by raja-16327 on 04/04/23.
//

import Foundation
import AppKit

class demo: NSView {
    
    let v1 = view2()
    
    override init(frame frameRect: NSRect) {
        
        super.init(frame: frameRect)
        addSubview(v1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func keyUp(with event: NSEvent) {
        print("kup")
    }
    
    override func keyDown(with event: NSEvent) {
        print("kd")
    }
    
    override var acceptsFirstResponder: Bool {
        true
    }
    
    override func resignFirstResponder() -> Bool {
        true
    }
    
    override func becomeFirstResponder() -> Bool {
        true
    }
}


class view2: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: NSRect(x: 0, y: 0, width: 600, height: 600))
        wantsLayer = true
        layer?.backgroundColor = .black
        window?.makeFirstResponder(self)
    }
    
    override var acceptsFirstResponder: Bool {
        true
    }
    
    override func resignFirstResponder() -> Bool {
        true
    }
    
    override func becomeFirstResponder() -> Bool {
        true
    }
    
    override func keyUp(with event: NSEvent) {
        print("inner up")
    }
    override func keyDown(with event: NSEvent) {
        print("inner dn")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
