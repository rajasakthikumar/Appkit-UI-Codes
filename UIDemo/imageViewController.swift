//
//  imageViewController.swift
//  UIDemo
//
//  Created by aravind-pt6209 on 19/03/23.
//
import Cocoa
import Foundation


class LoginViewController: NSViewController {
    
    var loginView = LoginView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        MARK: Image View
        
        let image = loginView.addImage()

        
//        MARK: CMTools Title

        let textFirst = loginView.getTextMessage(message: "CMT", size: 100)
        let settingsIcon = loginView.symbolIcon(symbolName: "gearshape")
        let settingsIcon2 = loginView.symbolIcon(symbolName: "gearshape")
        let textLast = loginView.getTextMessage(message: "ls", size: 100)
        
        let textView = NSStackView(views: [textFirst, settingsIcon, settingsIcon2, textLast])
        textView.orientation = .horizontal
        textView.spacing = 0
        textView.alignment = .firstBaseline
        

//        MARK: Login Form View

        let loginFormView = loginView.loginForm()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        loginView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        loginFormView.translatesAutoresizingMaskIntoConstraints = false
        
        view = loginView
        loginView.addSubview(image)
        loginView.addSubview(textView)
        loginView.addSubview(loginFormView)
        
//    MARK: CONSTRAINTS

        NSLayoutConstraint.activate([
            loginView.heightAnchor.constraint(equalTo: view.heightAnchor),

            image.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -20),
            image.leftAnchor.constraint(equalTo: loginView.leftAnchor, constant: 100),
            
            textView.bottomAnchor.constraint(equalTo: image.topAnchor),
            textView.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            
            settingsIcon.bottomAnchor.constraint(equalTo: textFirst.bottomAnchor, constant: -35),
            settingsIcon2.bottomAnchor.constraint(equalTo: textLast.bottomAnchor, constant: -35),
            
            loginFormView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 150),
            loginFormView.centerYAnchor.constraint(equalTo: loginView.centerYAnchor)
        ])

    }
    
    // Set View to the View Controller
    override func loadView() {
            view = NSView(frame: NSRect(x: 0, y: 0, width: 1920, height: 1080))
    }

}
