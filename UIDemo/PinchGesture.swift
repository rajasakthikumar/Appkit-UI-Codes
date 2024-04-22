//
//  PinchGesture.swift
//  UIDemo
//
//  Created by aravind-pt6209 on 03/04/23.
//

import Foundation
import AppKit

class VViewController: NSViewController {

    var imageView = NSImageView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))

        override func loadView() {
                view = NSView(frame: NSRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!))
            view.wantsLayer = true
            view.layer?.backgroundColor = .white
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.image = NSImage(named: "boy")
        
        let pinchRecognizer = NSMagnificationGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        imageView.addGestureRecognizer(pinchRecognizer)
    }

    @objc func handlePinch(_ recognizer: NSMagnificationGestureRecognizer) {
        print("pinch")
        if recognizer.state ==  zoom level based on the pinch gesture
            let zoomDelta = recognizer.magnification
            let zoomFactor: CGFloat = 1.0 + zoomDelta
            let zoomTransform = CGAffineTransform(scaleX: zoomFactor, y: zoomFactor)
            
            // Apply the zoom transform to the image view
            imageView.layer?.setAffineTransform(zoomTransform.concatenating(imageView.layer!.affineTransform()))
            
            // Reset the gesture's magnification property
            recognizer.magnification = 0
        }
    }
}
