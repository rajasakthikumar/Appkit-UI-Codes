//
//  SplitViewController.swift
//  UIDemo
//
//  Created by raja-16327 on 20/03/23.
//
import Cocoa
import AppKit


class SplitView: NSViewController {

    var splitView: NSSplitView!
    var toggleButton: NSButton!
    var sidebarWidthConstraint: NSLayoutConstraint!
    
    override func loadView() {
            view = NSView(frame: NSRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!))
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the left and right views
        let leftView = NSView()
        leftView.wantsLayer = true
        leftView.layer?.backgroundColor = NSColor.systemBlue.cgColor
        let rightView = NSView()
        rightView.wantsLayer = true
        rightView.layer?.backgroundColor = NSColor.systemPink.cgColor

        // Set up the split view
        splitView = NSSplitView(frame: NSRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        splitView.dividerStyle = .thin
        splitView.isVertical = true
        splitView.addArrangedSubview(leftView)
        splitView.addArrangedSubview(rightView)
        
        
        toggleButton = NSButton(title: "Hide Sidebar", target: self, action: #selector(toggleSidebar(sender:)))
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.bezelColor = .black
        
    
        view.addSubview(splitView)
        view.addSubview(toggleButton)

        
        // Set up the sidebar width constraint
        leftView.translatesAutoresizingMaskIntoConstraints = false
        sidebarWidthConstraint = leftView.widthAnchor.constraint(equalToConstant: 200)
        sidebarWidthConstraint.isActive = true
        splitView.translatesAutoresizingMaskIntoConstraints  = false
        // Set up the layout constraints
        NSLayoutConstraint.activate([
            toggleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            toggleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            toggleButton.widthAnchor.constraint(equalToConstant: 100),
            splitView.topAnchor.constraint(equalTo: view.topAnchor),
            splitView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            splitView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splitView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    @objc func toggleSdebar(sender: NSButton) {
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 1.0 // Set the duration of the animation
            self.view.animator().alphaValue = 0 // Change the alpha value of the view to 0
        }) {
            self.view.isHidden = true // Hide the view after the animation completes
        }
    }

    @objc func toggleSidebar(sender: NSButton) {
//        print(sidebarWidthConstraint.c)
        let isSidebarHidden = (sidebarWidthConstraint.constant == 0.0)
        print(isSidebarHidden)
        let newWidth: CGFloat = isSidebarHidden ? 200 : 0
        let animationDuration = 0.7
        sidebarWidthConstraint.constant = newWidth
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = animationDuration
            context.allowsImplicitAnimation = true
            splitView.layoutSubtreeIfNeeded()
        }, completionHandler: { [self] in
            
            // Update the toggle button title after the animation completes
            
            print(isSidebarHidden)
            let newTitle = isSidebarHidden ? "Hide Sidebar" : "Show Sidebar"
            print(isSidebarHidden)
            self.toggleButton.title = newTitle
            print("\(sidebarWidthConstraint.constant) - \(isSidebarHidden) - \(newTitle)")
        })
    }
    
}




