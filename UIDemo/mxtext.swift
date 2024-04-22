//
//  mxtext.swift
//  UIDemo
//
//  Created by aravind-pt6209 on 19/03/23.
//

import Foundation
import AppKit

class MTextField: NSTextField {
  
    func getTextField(placeholderString: String, width: CGFloat, height: CGFloat, cornerRadius: CGFloat, fontSize: CGFloat, fontWeight: NSFont.Weight) -> NSTextField {
        let inputField = NSTextField(frame: NSRect(x: 0, y: 0, width: width, height: height))
        inputField.isEditable = false
        inputField.isSelectable = false
        inputField.isBordered = false
        inputField.backgroundColor = bgColor
        inputField.wantsLayer = true
        inputField.layer?.cornerRadius = cornerRadius
                
        let textField = NSTextField(frame: NSRect(x: 15, y: (height-fontSize)/2-1, width: width, height: height))
        textField.layerContentsPlacement = .scaleAxesIndependently
        textField.isSelectable = true
        textField.isEditable = true
        textField.isBordered = false
        textField.focusRingType = .none
        textField.backgroundColor = bgColor
        textField.placeholderString = placeholderString
        textField.lineBreakStrategy = .standard
        textField.textColor = fontColor
        textField.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        textField.usesSingleLineMode = true
        textField.maximumNumberOfLines = 1
        textField.isVerticalContentSizeConstraintActive = true
        
        let font = NSFont.systemFont(ofSize: fontSize, weight: .light)
        let para = NSMutableParagraphStyle()
        para.alignment = .left
        let attrs = [NSAttributedString.Key.foregroundColor: fontColor, NSAttributedString.Key.font: font, .paragraphStyle: para]
        let placeholderString = NSAttributedString(string: placeholderString, attributes: attrs)
        textField.placeholderAttributedString = placeholderString
        
        
        inputField.addSubview(textField)
        inputField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputField.heightAnchor.constraint(equalToConstant: height),
            inputField.widthAnchor.constraint(equalToConstant: width)
            
        ])
        
        return inputField
    }
    
    
    func getSecureTextField(placeholderString: String, width: CGFloat, height: CGFloat, cornerRadius: CGFloat, fontSize: CGFloat, fontWeight: NSFont.Weight) -> NSTextField {
        let inputField = NSSecureTextField(frame: NSRect(x: 0, y: 0, width: width, height: height))
        inputField.isEditable = false
        inputField.isSelectable = false
        inputField.isBordered = false
        inputField.backgroundColor = bgColor
        inputField.wantsLayer = true
        inputField.layer?.cornerRadius = cornerRadius
                
        let textField = NSSecureTextField(frame: NSRect(x: 15, y: (height-fontSize)/2-1, width: width, height: height))
        textField.layerContentsPlacement = .scaleAxesIndependently
        textField.isSelectable = true
        textField.isEditable = true
        textField.isBordered = false
        textField.focusRingType = .none
        textField.backgroundColor = bgColor
        textField.placeholderString = placeholderString
        textField.lineBreakStrategy = .standard
        textField.textColor = fontColor
        textField.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        textField.usesSingleLineMode = true
        textField.maximumNumberOfLines = 1
        textField.isVerticalContentSizeConstraintActive = true
        
        let font = NSFont.systemFont(ofSize: fontSize, weight: .light)
        let para = NSMutableParagraphStyle()
        para.alignment = .left
        let attrs = [NSAttributedString.Key.foregroundColor: fontColor, NSAttributedString.Key.font: font, .paragraphStyle: para]
        let placeholderString = NSAttributedString(string: placeholderString, attributes: attrs)
        textField.placeholderAttributedString = placeholderString
        
        
        inputField.addSubview(textField)
        inputField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputField.heightAnchor.constraint(equalToConstant: height),
            inputField.widthAnchor.constraint(equalToConstant: width)
            
        ])
        
        return inputField
    }
    
    
    func getText(text: String, size: Int, color: NSColor, weight: NSFont.Weight) -> NSTextField {
        
        let textField = NSTextField(wrappingLabelWithString: text)
        textField.isSelectable = true
        textField.lineBreakStrategy = .standard
        textField.textColor = color
        textField.font = .systemFont(ofSize: CGFloat(size), weight: weight)
      
        return textField
    }
    
    func linkString(text: String, url: String) -> NSMutableAttributedString {
            // initially set viewable text
        let attrString = NSMutableAttributedString(string: text)
        attrString.setAttributes([.link: NSURL(string: url) as Any, .font: NSFont(name: "arial", size: 18.0) as Any], range: NSRange(location: 3, length: url.count))
       
        return attrString
    }
}
