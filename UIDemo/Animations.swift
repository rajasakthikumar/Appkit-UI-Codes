//
//  Animations.swift
//  UIDemo
//
//  Created by raja-16327 on 04/04/23.
//

import Foundation
import AppKit

class Animation: NSView {
    
    let subView = NSView(frame: NSRect(x: 300, y: 300, width: 300, height: 300))
    let button = NSButton(frame: NSRect(x: 400, y: 100, width: 80, height: 40))
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var wantsUpdateLayer: Bool {
        true
    }
    
    override func updateLayer() {
        subView.wantsLayer = true
        subView.layer?.backgroundColor =  .black
        button.wantsLayer = true
        button.layer?.backgroundColor = NSColor.red.cgColor
        button.target = self
        button.action = #selector(animateChange(sender:))
        addSubview(subView)
        addSubview(button)
    }
    
    @objc func animateChange(sender: NSButton) {
        if sender.state == .on {
            NSAnimationContext.runAnimationGroup( {
                context in
                context.duration = 1.0
                subView.animator().alphaValue = 0
            }, completionHandler:  {
                self.subView.isHidden = true
            })
        } else {
            NSAnimationContext.runAnimationGroup( {
                context in
                
                context.duration = 1.0
                subView.animator().alphaValue = 1
                self.subView.isHidden = false
            }, completionHandler:  {
               
            })
            
        }
        
        
    }
}
