//
//  StackView.swift
//  UIDemo
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import AppKit

class StackViewViewController: NSViewController {

    var leftTopView = NSView()
    var leftBottomView = NSView()
    var rightTopView = NSView()
    var rightBottomView = NSView()

    var mainStack: NSStackView!

    override func loadView() {

        view = NSView(frame:  NSRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!))

    }

    override func viewDidLoad() {

        super.viewDidLoad()

        let leftVerticalStackView = NSStackView(views: [leftTopView, leftBottomView])
        leftVerticalStackView.orientation = .vertical
        leftVerticalStackView.distribution = .fillEqually
        leftVerticalStackView.spacing = 0

        let rightVerticalStackView = NSStackView(views: [rightTopView, rightBottomView])
        rightVerticalStackView.orientation = .vertical
        rightVerticalStackView.distribution = .fillEqually
        rightVerticalStackView.spacing = 0

        mainStack = NSStackView(frame: NSRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        mainStack.spacing = 0

        mainStack.addArrangedSubview(leftVerticalStackView)
        mainStack.addArrangedSubview(rightVerticalStackView)
        mainStack.distribution = .fillEqually
        view.addSubview(mainStack)

        leftTopView.wantsLayer = true
        leftBottomView.wantsLayer = true
        rightTopView.wantsLayer = true
        rightBottomView.wantsLayer = true


        leftTopView.layer?.backgroundColor = NSColor(red: 0.918, green: 0.200, blue: 0.137, alpha: 1).cgColor
        leftBottomView.layer?.backgroundColor = NSColor(red: 0.216, green: 0.494, blue: 0.965, alpha: 1).cgColor
        rightTopView.layer?.backgroundColor = NSColor(red: 0.216, green: 0.494, blue: 0.133, alpha: 1).cgColor
        rightBottomView.layer?.backgroundColor = NSColor(red: 0.937, green: 0.529, blue: 0.314, alpha: 1).cgColor
    }

    override func viewDidLayout() {
        print(mainStack.frame)
        print(view.bounds)
        mainStack.frame = view.bounds
    }
}
