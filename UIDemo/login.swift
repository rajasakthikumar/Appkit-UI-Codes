//
//  login.swift
//  UIDemo
//
//  Created by aravind-pt6209 on 19/03/23.
//

import Foundation
import Cocoa

//
//  LoginView.swift
//  CMToolsMacOSUI
//
//  Created by maaz-pt5613 on 23/09/22.
//

class LoginView: NSView {
    
   
    var loadingView = NSView()
    
    // User Info delegate to launch Dashboard view if username and access token is correct
    
    var loginButton = NSButton()
    let loginFormView = NSView(frame: NSRect(x: 0, y: 0, width: 500, height: 800))
    var errorMessage = NSTextField()
    var username: NSTextField = NSTextField()
    var accessToken: NSTextField = NSTextField()
    
    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
       
        bgColor.setFill()
        dirtyRect.fill()
    }
    
    
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 1920, height: 1080))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: ADD IMAGE
    
    public func addImage() -> NSImageView {
        
        let image = NSImageView(image: NSImage(named: NSImage.Name("LoginVectorImage"))!)
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 650),
            image.heightAnchor.constraint(equalToConstant: 650)
        ])
        
        return image
    }
    
//    MARK: TEXT MESSAGE

    public func getTextMessage(message: String, size: Int) -> NSTextField {
        
        let textField = NSTextField(labelWithString: message)
        textField.isSelectable = true
        textField.textColor = fontColor
        textField.font = .systemFont(ofSize: CGFloat(size))
        
        return textField
    }


//    MARK: SYMBOL ICON

    func symbolIcon(symbolName: String) -> NSImageView {
        
        let iconImage = NSImage(systemSymbolName: symbolName, accessibilityDescription: nil)!
        
        var config = NSImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .large)
        config = config.applying(.init(paletteColors: [themeColor]))

        let imageView = NSImageView(image: iconImage.withSymbolConfiguration(config)!)

        return imageView
    }
      
//    MARK: ADD BUTTON

    func getButton() -> NSButton {
        
        let loginButton = NSButton(frame: NSRect(x: 0, y: 0, width: 100, height: 30))
        loginButton.font = .systemFont(ofSize: 20, weight: .semibold)
        loginButton.contentTintColor = themeColor
        loginButton.wantsLayer = true
        loginButton.isBordered = false
        loginButton.layer?.backgroundColor = bgColor.cgColor
        loginButton.layer?.cornerRadius = 20
        loginButton.title = "Login"
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 140),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        return loginButton
    }
    
//    MARK: LOGIN FORM

    func loginForm() -> NSView {
        
        loginFormView.wantsLayer = true
        loginFormView.layer?.backgroundColor = blockColor.cgColor
        loginFormView.layer?.cornerRadius = 20
        
        let displayText = getTextMessage(message: "Login", size: 75)
        loginFormView.addSubview(displayText)
        
        let usernameEmailField = MTextField().getTextField(placeholderString: "Enter Your Username or Email", width: 400, height: 40, cornerRadius: 20, fontSize: 15, fontWeight: .regular)
        
        let label = getTextMessage(message: "Username/Email", size: 15)

        let privateTokenField = MTextField().getSecureTextField(placeholderString: "Enter Your Private Access Token", width: 400, height: 40, cornerRadius: 20, fontSize: 15, fontWeight: .regular)
        
        let label2 = getTextMessage(message: "Private Access Token", size: 15)
        
        let userInfoForm = NSStackView(views: [label, usernameEmailField, label2, privateTokenField])
        userInfoForm.orientation = .vertical
        userInfoForm.spacing = 15
        userInfoForm.alignment = .left
        
        // Extract username field and access token field
        username = usernameEmailField.subviews[0] as! NSTextField
        accessToken = privateTokenField.subviews[0] as! NSTextField

        loginButton = getButton()

        loginButton.target = self
        loginButton.action = #selector(loginUser(sender:))
        loginFormView.addSubview(loginButton)
        loginFormView.addSubview(userInfoForm)
        
        displayText.translatesAutoresizingMaskIntoConstraints = false
        loginFormView.translatesAutoresizingMaskIntoConstraints = false
        usernameEmailField.translatesAutoresizingMaskIntoConstraints = false
        privateTokenField.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userInfoForm.translatesAutoresizingMaskIntoConstraints = false
        
//      MARK: LOGIN FORM CONSTRAINTS
        
        NSLayoutConstraint.activate([
            loginFormView.widthAnchor.constraint(equalToConstant: 500),
            loginFormView.heightAnchor.constraint(equalToConstant: 550),
            
            displayText.topAnchor.constraint(equalTo: loginFormView.topAnchor,constant: 50),
            displayText.centerXAnchor.constraint(equalTo: loginFormView.centerXAnchor),
           
            userInfoForm.centerXAnchor.constraint(equalTo: loginFormView.centerXAnchor),
            userInfoForm.centerYAnchor.constraint(equalTo: loginFormView.centerYAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: loginFormView.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: loginFormView.bottomAnchor, constant: -75)
        ])

        return loginFormView
    }
    
    public func addLoadingView() {
        
        let indicator = NSProgressIndicator(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        indicator.minValue = 0.0
        indicator.maxValue = 100.0
        indicator.doubleValue = 10
        indicator.controlSize = .large
        indicator.wantsLayer = true
        indicator.controlTint = .graphiteControlTint
        indicator.style = .spinning
        indicator.isIndeterminate = true
        indicator.startAnimation(self)
        
        loadingView.addSubview(indicator)
        
        loadingView.wantsLayer = true
        
        loadingView.layer?.backgroundColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        
        self.addSubview(loadingView)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            loadingView.heightAnchor.constraint(equalTo: self.heightAnchor),
            loadingView.widthAnchor.constraint(equalTo: self.widthAnchor),
            loadingView.leftAnchor.constraint(equalTo: self.leftAnchor),
            loadingView.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
    
    
    @objc func loginUser(sender: NSButton) {
        errorMessage.stringValue = ""
        if(username.stringValue.contains(" ") || accessToken.stringValue.contains(" ")) {
            errorMessage = MTextField().getText(text: "Fields cannot contain whitespaces", size: 15, color: NSColor(red: 1, green: 0, blue: 0, alpha: 0.6), weight: .bold)
        }
        else {
//            addLoadingView()
//            presenter.viewLoaded(zuid: username.stringValue, privateToken: accessToken.stringValue)
        }
    }
}
