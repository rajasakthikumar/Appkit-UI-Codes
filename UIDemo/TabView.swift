//
//  TabView.swift
//  UIDemo
//
//  Created by raja-16327 on 02/04/23.
//

import Foundation
import AppKit

class TabView: NSView {
    
    var tabView: NSTabView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        tabView = NSTabView(frame: NSRect(x: 50, y: 20, width: 1400, height: 800))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var wantsUpdateLayer: Bool {
        true
    }
    
    override func updateLayer() {
        
        let tab1 = NSTabViewItem(identifier: "tab1")
        tab1.label = "TAB1"
        tab1.view = NSView(frame: tabView.bounds)
        tab1.view?.wantsLayer = true
        tab1.view?.layer?.backgroundColor = NSColor.red.cgColor
        
        
        let tab2 = NSTabViewItem(identifier: "tab2")
        tab2.label = "TAB2"
        tab2.view = NSView(frame: tabView.bounds)
        tab2.view?.wantsLayer = true
        tab2.view?.layer?.backgroundColor = NSColor.green.cgColor
        
        
        tabView.addTabViewItem(tab1)
        tabView.addTabViewItem(tab2)
        
        addSubview(tabView)
    }
}
