//
//  ProgressIndicator.swift
//  UIDemo
//
//  Created by raja-16327 on 01/04/23.
//

import Foundation
import AppKit

public class ProgressIndicator: NSView {
    
    let roundIndicator = NSProgressIndicator()
    let barIndicator = NSProgressIndicator()
    let actionButton = NSButton()
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: NSRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!))
        wantsLayer = true
        layer?.backgroundColor = NSColor.systemBrown.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        roundIndicator.style = .spinning
        barIndicator.style = .bar
        actionButton.title = "Start"
        actionButton.setButtonType(.toggle)
        actionButton.alternateTitle = "Stop"
        actionButton.bezelStyle  = .rounded
        actionButton.bezelColor = .green
        actionButton.target = self
        actionButton.action = #selector(actionControl(sender:))
        
        addSubview(roundIndicator)
        addSubview(barIndicator)
        addSubview(actionButton)
        setConstraints()
    }
    
    func setConstraints() {
        
        roundIndicator.translatesAutoresizingMaskIntoConstraints = false
        barIndicator.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
                roundIndicator.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -200),
                roundIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
                roundIndicator.widthAnchor.constraint(equalToConstant: 200),
                roundIndicator.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            barIndicator.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 200),
            barIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            barIndicator.widthAnchor.constraint(equalToConstant: 200),
            barIndicator.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
            actionButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    @objc func actionControl(sender: NSButton ) {
        print(sender.state)
        if sender.state == .on {
      
            roundIndicator.startAnimation(sender)
            barIndicator.startAnimation(sender)
            sender.bezelColor = .red
        }
        else {
            roundIndicator.stopAnimation(sender)
            barIndicator.stopAnimation(sender)
            sender.bezelColor = .green
        }
    }
    
}
