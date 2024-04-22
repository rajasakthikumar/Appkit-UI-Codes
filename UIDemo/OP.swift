//
//  OP.swift
//  UIDemo
//
//  Created by aravind-pt6209 on 29/03/23.
//

import Foundation
import AppKit

class OP: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: NSRect(x: 0, y: 0, width: 500, height: 500))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        print(self.frame.width)
        print(self.frame.height)
    }
}
