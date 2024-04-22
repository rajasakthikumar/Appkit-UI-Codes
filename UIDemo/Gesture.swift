//
//  Gestures.swift
//  UIDemo
//
//  Created by raja-16327 on 03/04/23.
//

import Foundation
import AppKit

class Gesture: NSView {
    
   
    override var wantsUpdateLayer: Bool {
        true
    }
    
    override func updateLayer() {
        layer?.backgroundColor = .white
        
    }
    
    
    override func viewDidMoveToWindow() {
        
        let swipeRecognizer = NSPanGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer: )))
        addGestureRecognizer(swipeRecognizer)
        
        let singleClickRecognizer = NSClickGestureRecognizer(target: self, action: #selector(handleSingleClick(recognizer: )))
        addGestureRecognizer(singleClickRecognizer)
        singleClickRecognizer.numberOfClicksRequired = 1
        
        let pressRecognizer = NSPressGestureRecognizer(target: self, action: #selector(handlePress(recognizer: )))
        addGestureRecognizer(pressRecognizer)
        pressRecognizer.minimumPressDuration = 2
        
        let rotationRecognizer = NSRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        addGestureRecognizer(rotationRecognizer)
        
        let magnituteGesture = NSMagnificationGestureRecognizer(target: self, action:  #selector(handleZoom(_:)))
        addGestureRecognizer(magnituteGesture)
    }
    
    
    @objc func handleSwipe(recognizer: NSPanGestureRecognizer) {
        if recognizer.state == .ended {
            print("Pan Getsure")
            let translation = recognizer.translation(in: self)
            if translation.x > 0 {
                layer?.backgroundColor = NSColor.red.cgColor
            } else {
                layer?.backgroundColor = NSColor.systemOrange.cgColor
            }
        }
    }
    
    @objc func handleSingleClick(recognizer: NSClickGestureRecognizer) {
        
//        Possible —> Began —> [Changed] —> Cancelled
//
//        Possible —> Began —> [Changed] —> Ended
        
        if recognizer.state == .ended {
            
            layer?.backgroundColor = NSColor.systemCyan.cgColor
                    print("Single Tap Gesture")
        }
    }
    
    @objc func handlePress(recognizer: NSClickGestureRecognizer) {
        if recognizer.state == .ended {
            
            layer?.backgroundColor = NSColor.systemGreen.cgColor
            print("Press Gesture")
        }
    }
    
    @objc func handleRotation(_ recognizer: NSRotationGestureRecognizer) {
            let rotation = recognizer.rotation
            print("Rotation", rotation)
            if recognizer.state == .changed {
                if rotation < 0 {
                    layer?.backgroundColor = NSColor.systemBlue.cgColor
                }
                else {
                    layer?.backgroundColor = NSColor.systemPurple.cgColor
                }
            }
    }
    
    @objc func handleZoom(_ recognizer: NSMagnificationGestureRecognizer) {
        let zoom = recognizer.magnification
        print("Zoom", zoom)
        if recognizer.state == .changed {
            if zoom < 0 {
                layer?.backgroundColor = NSColor.systemGray.cgColor
            }
            else {
                layer?.backgroundColor = NSColor.systemBrown.cgColor
            }
            
        }
    }
}
