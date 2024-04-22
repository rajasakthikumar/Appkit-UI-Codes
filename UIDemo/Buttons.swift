//
//  Buttons.swift
//  UIDemo
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import AppKit

class Button: NSView {
    
    let containerView = NSView()
    let label =  NSTextField(labelWithString: "BUTTONS")
    
    override var wantsUpdateLayer: Bool {
        return true
    }
    
    override func updateLayer() {
        
        containerView.wantsLayer = true
        containerView.layer?.backgroundColor = .init(gray: 0.45, alpha: 0.75)
        label.sizeToFit()
        label.font = .boldSystemFont(ofSize: 30)
        addSubview(label)
        addSubview(containerView)
        
        setConstraints()
        addButton()
    }
    
    func setConstraints() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.80),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -100),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            label.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -20),
            label.widthAnchor.constraint(equalToConstant: 150),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    func addButton() {
        
        let switchButton = NSButton(title: "Switch", target: nil, action: nil)
        switchButton.setButtonType(.switch)
        switchButton.isBordered = true
        containerView.addSubview(switchButton)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: 500).isActive = true
        switchButton.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 40).isActive = true
        
        
        let momentoryLight = NSButton(title: "Momentory LIght", target: nil, action: nil)
        momentoryLight.controlSize = .large
        momentoryLight.setButtonType(.momentaryLight)
        containerView.addSubview(momentoryLight)
        momentoryLight.translatesAutoresizingMaskIntoConstraints = false
        momentoryLight.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 500).isActive = true
        momentoryLight.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 130) .isActive = true
        momentoryLight.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        let momentoryChange = NSButton(title: "Momentory Change", target: nil, action: nil)
        momentoryChange.controlSize = .large
        momentoryChange.setButtonType(.momentaryChange)
        momentoryChange.alternateTitle = "Clicked"
        containerView.addSubview(momentoryChange)
        momentoryChange.translatesAutoresizingMaskIntoConstraints = false
        momentoryChange.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 500).isActive = true
        momentoryChange.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 190) .isActive = true
        momentoryChange.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        let radioButton = NSButton(title: "radioButton", target: nil, action: nil)
        radioButton.setButtonType(.radio)
        radioButton.frame = NSRect(x: 50, y: 50, width: 100, height: 20)
        radioButton.state = .on
        
        containerView.addSubview(radioButton)
        radioButton.translatesAutoresizingMaskIntoConstraints = false
        radioButton.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 240).isActive = true
        radioButton.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: 500).isActive = true
        
        let customButton = NSButton(title: "Button", target: nil, action: nil)
        customButton.controlSize = .large
        customButton.bezelColor = .green
        containerView.addSubview(customButton)
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 500).isActive = true
        customButton.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 90).isActive = true
        customButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        let toggleButton = NSButton(image: NSImage(named: "toggleoff")! , target: nil, action: nil)
        toggleButton.controlSize = .large
        toggleButton.setButtonType(.toggle)
        toggleButton.alternateImage = NSImage(named: "toggleon")
        toggleButton.imageScaling = .scaleAxesIndependently
        containerView.addSubview(toggleButton)
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 500).isActive = true
        toggleButton.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 270).isActive = true
        toggleButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        let imageButton = NSButton(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        imageButton.bezelColor = .green
        imageButton.image = NSImage(named: "boy")
        imageButton.imageScaling = .scaleAxesIndependently
        containerView.addSubview(imageButton)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 500).isActive = true
        imageButton.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 350).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
}
