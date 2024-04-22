//
//  TextField.swift
//  UIDemo
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import AppKit

class TextField: NSView {
    
    let textField1 = NSTextField()
    let textFieldWithPlaceHolder = NSTextField()
    let textFieldInLabel = NSTextField(labelWithString: "LABEL")
    let customTextField = NSTextField(frame: NSRect(x: 500, y: 100, width: 300, height: 60))
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        textField1.textColor = .black
        textField1.bezelStyle = .squareBezel
        textField1.backgroundColor = .white
        textField1.alignment = .center
        textField1.stringValue = "Aravind"
        textField1.isEditable = true
        textField1.isBezeled = true
        textField1.isBezeled = true
        textField1.wantsLayer = true
        textField1.layer?.backgroundColor = .white
        textField1.bezelStyle = .squareBezel
        textField1.target = self
        textField1.action = #selector(finished(sender: ))
        textFieldWithPlaceHolder.placeholderString = "PlaceHolder String"
        textFieldWithPlaceHolder.textColor = .systemGreen
        textFieldInLabel.textColor = .red
        textFieldInLabel.font = .systemFont(ofSize: 50)
        
        let attributedString = NSAttributedString(string: "I Am Good Boy", attributes: [.font: NSFont(name: "Chalkduster", size: 30)!])
        customTextField.attributedStringValue = attributedString
        customTextField.isEditable = false
        addSubview(textFieldWithPlaceHolder)
        addSubview(textField1)
        addSubview(textFieldInLabel)
        addSubview(customTextField)
        setConstraints()
        
    }
    
    func setConstraints() {
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textFieldWithPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        textFieldInLabel.translatesAutoresizingMaskIntoConstraints = false
        customTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            textField1.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            textField1.heightAnchor.constraint(equalToConstant: 300),
            textField1.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.5),
            textFieldWithPlaceHolder.leadingAnchor.constraint(equalTo: textField1.trailingAnchor, constant: 50),
            textFieldWithPlaceHolder.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            textFieldWithPlaceHolder.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            textFieldWithPlaceHolder.heightAnchor.constraint(equalToConstant: 100),
            textFieldInLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            textFieldInLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            textFieldInLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
        ])
    }
    
    
    @objc func finished(sender: NSButton) {
        print(sender.stringValue)
        sender.stringValue = ""
        print("clicked")
    }
}
