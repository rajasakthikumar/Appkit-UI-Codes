//
//  PopOver.swift
//  UIDemo
//
//  Created by raja-16327 on 02/04/23.
//

import Foundation
import AppKit

public class PopOver: NSView {
    
    var popover: NSPopover?
    var button: NSButton?

    public override init(frame frameRect: NSRect) {
        
        super.init(frame: frameRect)
        popover = NSPopover()
        popover?.behavior = .transient
        
        popover?.contentSize = NSSize(width: 200, height: 200)
        button = NSButton(title: "Show Popover", target: self, action: #selector(showPopover(_:)))
        button?.frame = NSRect(x: 700, y: 450, width: 120, height: 30)
        addSubview(button!)
        popover?.contentViewController = PopoverContentViewController()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func showPopover(_ sender: NSButton) {
        if let popover = popover {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: sender.bounds, of: sender, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}


class PopoverContentViewController: NSViewController {

    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.black.cgColor

        let label = NSTextField(labelWithString: "Popover Content")
        label.alignment = .center
        label.frame = NSRect(x: 20, y: 40, width: 150, height: 40)
        view.addSubview(label)
    }
}
