//
//  AutoLayout.swift
//  UIDemo
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import Cocoa


class AutoLayoutViewController: NSViewController {

    var leftTopView =  NSView()
    var leftBottomView = NSView()
    var rightTopView = NSView()
    var rightBottomView =  NSView()

    override func loadView() {

        view = NSStackView(frame:  NSRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        leftTopView.wantsLayer = true
        leftBottomView.wantsLayer = true
        rightTopView.wantsLayer = true
        rightBottomView.wantsLayer = true

        leftTopView.layer?.backgroundColor = NSColor(red: 0.918, green: 0.200, blue: 0.137, alpha: 1).cgColor
        leftBottomView.layer?.backgroundColor = NSColor(red: 0.216, green: 0.494, blue: 0.965, alpha: 1).cgColor
        rightTopView.layer?.backgroundColor = NSColor(red: 0.216, green: 0.494, blue: 0.133, alpha: 1).cgColor
        rightBottomView.layer?.backgroundColor = NSColor(red: 0.937, green: 0.529, blue: 0.314, alpha: 1).cgColor
        
        
        view.addSubview(leftTopView)
        view.addSubview(leftBottomView)
        view.addSubview(rightTopView)
        view.addSubview(rightBottomView)

        leftTopView.translatesAutoresizingMaskIntoConstraints = false
        leftBottomView.translatesAutoresizingMaskIntoConstraints = false
        rightTopView.translatesAutoresizingMaskIntoConstraints = false
        rightBottomView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            leftTopView.topAnchor.constraint(equalTo: view.topAnchor),
            leftTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leftTopView.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            leftTopView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            leftBottomView.topAnchor.constraint(equalTo: leftTopView.bottomAnchor),
            leftBottomView.leadingAnchor.constraint(equalTo: leftTopView.leadingAnchor),
            leftBottomView.widthAnchor.constraint(equalTo: leftTopView.widthAnchor),
            leftBottomView.heightAnchor.constraint(equalTo: leftTopView.heightAnchor),
        ])

        NSLayoutConstraint.activate([
            rightTopView.topAnchor.constraint(equalTo: leftTopView.topAnchor),
            rightTopView.leadingAnchor.constraint(equalTo: leftTopView.trailingAnchor),
            rightTopView.widthAnchor.constraint(equalTo: leftTopView.widthAnchor),
            rightTopView.bottomAnchor.constraint(equalTo: leftTopView.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            rightBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rightBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rightBottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2), // dynamic size
            rightBottomView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2)   //  dynamic size

//            rightBottomView.widthAnchor.constraint(equalToConstant: view.frame.width/2),  // constant size
        ])
    }

}
