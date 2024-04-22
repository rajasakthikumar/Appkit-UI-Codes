//
//  AppDelegate.swift
//  UIDemo
//
//  Created by raja-16327 on 18/03/23.
//

import Cocoa


class AppDelegate: NSObject, NSApplicationDelegate {

    var window : NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!), styleMask: [.titled,.resizable,.closable], backing: .buffered, defer: true)
        window.contentMinSize = NSSize(width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height - 130)
        window.contentMaxSize = NSSize(width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height - 130)
//                  window.contentView = CollectionView()
//                  window.contentView = TableView()
//                  window.contentView = TextField()
//                  window.contentView = Button()
//                  window.contentView = TabView()
//                  window.contentView = PopOver()
//                  window.contentView = PopUpButton()
//                  window.contentView = ProgressIndicator()
//                  window.contentView = Gesture()
//                  window.contentView = Event()
//                  window.contentView = Animation()
//                  window = NSWindow(contentViewController: StackViewViewController())
//                  window = NSWindow(contentViewController: SplitView())
//                  window = NSWindow(contentViewController: Authentication())
//                  window = NSWindow(contentViewController: AutoLayoutViewController())
        window.title = "UI Demo"
        window.makeKeyAndOrderFront(nil)
    }
}

