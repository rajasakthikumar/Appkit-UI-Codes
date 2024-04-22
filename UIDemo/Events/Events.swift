//
//  Events.swift
//  UIDemo
//
//  Created by raja-16327 on 03/04/23.
//

import Foundation
import AppKit

class Event: NSView  {
    
    public static let image =  NSImageView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
    public static let data = [NSImage(named: "boy"), NSImage(named: "girl")]
    
    override var wantsUpdateLayer: Bool {
        true
    }
    
    override func mouseDown(with event: NSEvent) {
        print("dn")
    }
    
    override func mouseUp(with event: NSEvent) {
        print("up")
    }
    
    override func mouseExited(with event: NSEvent) {
        print("Exited")
    }
    
    override func mouseEntered(with event: NSEvent) {
        print("Entered")
    }
    
    override func updateLayer() {
        layer?.backgroundColor = .white
        addSubview(innnerView())
        addSubview(Event.image)
        Event.image.image = Event.data[0]
        
    }
    
    override func keyDown(with event: NSEvent) {
           
       if event.keyCode == 125 {
           Event.image.image = Event.data[1]
       } else if event.keyCode == 126 {
           Event.image.image = Event.data[0]
       }
    }
    
    override var acceptsFirstResponder: Bool {
        
        print("acceptfirst")
         return true
    }
    override func keyUp(with event: NSEvent) {
        print("keyup")
    }
    
    override func rightMouseDown(with event: NSEvent) {
       let clickLocation = convert(event.locationInWindow, from: nil)
       print("Right mouse down at \(clickLocation)")
    }
   
    override func rightMouseUp(with event: NSEvent) {
       let clickLocation = convert(event.locationInWindow, from: nil)
       print("Right mouse up at \(clickLocation)")
    }
   
    override func rightMouseDragged(with event: NSEvent) {
       let dragLocation = convert(event.locationInWindow, from: nil)
       print("Right mouse dragged to \(dragLocation)")
    }
    
  
}


class innnerView: NSView {
    let data = [NSImage(named: "sara"), NSImage(named: "andy")]
    override init(frame frameRect: NSRect) {
        super.init(frame: NSRect(x: 300, y: 300, width: 100, height: 100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var wantsUpdateLayer: Bool {
        true
    }
    override func updateLayer() {
        layer?.backgroundColor = .black
    }
    
    override var acceptsFirstResponder: Bool {

        print("acceptfirst")
         return true
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == 125 {
            Event.image.image = data[1]
        } else if event.keyCode == 126 {
            Event.image.image = data[0]
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        print("true")
        return true
    }
}




class LoginViewController: NSViewController {
    
    let usernameField = textField()
    let passwordField = textField()
    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 1000, height: 1000))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the frame for the username and password fields
        usernameField.frame = NSRect(x: 50, y: 100, width: 200, height: 20)
        passwordField.frame = NSRect(x: 50, y: 50, width: 200, height: 20)
        
        // Add the username and password fields to the view
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        
        // Add observer for textDidEndEditingNotification on username f
    }
    override func keyDown(with event: NSEvent) {
        if event.keyCode == 36 {
            print("jhh")
            view.becomeFirstResponder()
        }
    }
    
}


class textField: NSView  {
    
    let t1 = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
    let t2 = NSSecureTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
    override init(frame frameRect: NSRect) {
        super.init(frame: NSRect(x: 0, y: 0, width: 300, height: 20))
        
       
        t1.isEditable = true
        t2.isEditable = true
        t1.stringValue = "t1"
        t2.stringValue = "t2"
        let loginStack = NSStackView(views: [t1,t2])
        loginStack.frame = NSRect(x: 100, y: 100, width: 400, height: 400)
        loginStack.orientation = .vertical
        loginStack.spacing = 20
        loginStack.alignment = .left
        addSubview(loginStack)

        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func keyDown(with event: NSEvent) {
        
        if event.keyCode == 36 {
            t2.becomeFirstResponder()
        } else {
            t1.becomeFirstResponder()
        }
    }
    

}
