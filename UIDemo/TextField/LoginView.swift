//
//  LoginView.swift
//  UIDemo
//
//  Created by aravind-pt6209 on 04/04/23.
//

import Foundation
import AppKit

class LoginView: NSView {
    
    let imageView = NSImageView()
    let loginForm = NSView()
    let signUpForm = SignUpForm()
    var passwordTextField: NSSecureTextField!
    var emailTextField: NSTextField!
    var loginStack: NSStackView!
    
   
    override init(frame frameRect: NSRect) {
        
        super.init(frame: NSRect(x: 0, y: 0, width: 700, height: 700))
        wantsLayer = true
        addSubview(imageView)
        configureImageView()
        loginFormView()
        signUpFormView()
        signUpForm.isHidden = true
        if let firstResponder = window?.firstResponder {
            print("The first responder is \(firstResponder)")
        } else {
            print("No first responder")
        }

    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        imageView.image = NSImage(named: "logimage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 500),
            imageView.heightAnchor.constraint(equalToConstant: 600),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 65),
            NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 0.9, constant: 0),
        ])
    }
    
    func signUpFormView() {
        
        signUpForm.wantsLayer = true
        signUpForm.layer?.backgroundColor = .init(red: 0.2, green: 0.2, blue: 1, alpha: 0.2)
        signUpForm.layer?.cornerRadius = 50
        let string = "Already have an account!  Login"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.foregroundColor, value: NSColor.red, range: NSRange(location: 26, length: 5))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 26, length: 5))
        let loginLabel = getLabelString(text: string , size: 15)
        loginLabel.attributedStringValue = attributedString
        let singleClickRecognizer = NSClickGestureRecognizer(target: self, action: #selector(moveToLogin(sender:)))
        loginLabel.addGestureRecognizer(singleClickRecognizer)
        singleClickRecognizer.numberOfClicksRequired = 1
        signUpForm.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: signUpForm.centerXAnchor),
            loginLabel.centerYAnchor.constraint(equalTo: signUpForm.centerYAnchor, constant: 375)
        ])
        addSubview(signUpForm)
        signUpForm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpForm.heightAnchor.constraint(equalToConstant: 800),
            signUpForm.widthAnchor.constraint(equalToConstant: 490),
            signUpForm.centerYAnchor.constraint(equalTo: centerYAnchor),
            NSLayoutConstraint(item: signUpForm, attribute: .left, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.2, constant: 0)
        ])
    }
    
    func loadingProgress() -> NSView {
        let view = NSView(frame: NSRect(x: 0, y: 0, width: frame.width, height: frame.height))
        view.wantsLayer = true
        view.layer?.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.05)
        let progressIndicator = NSProgressIndicator()
        view.addSubview(progressIndicator)
        progressIndicator.style = .spinning
        progressIndicator.startAnimation(nil)
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressIndicator.heightAnchor.constraint(equalToConstant: 50),
            progressIndicator.widthAnchor.constraint(equalToConstant: 50)
        ])
        return view
    }
    
    func loginFormView() {
        
        addSubview(loginForm)
        loginForm.wantsLayer = true
        loginForm.layer?.backgroundColor = .init(red: 0.2, green: 0.2, blue: 1, alpha: 0.2)
        loginForm.layer?.cornerRadius = 50
        
        let Loginlabel = getLabelString(text: "Login", size: 50)
        loginForm.addSubview(Loginlabel)
        Loginlabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            Loginlabel.centerYAnchor.constraint(equalTo: loginForm.centerYAnchor, constant: -190),
            Loginlabel.centerXAnchor.constraint(equalTo: loginForm.centerXAnchor)
        ])
        
        let emailLabe1 = getLabelString(text: "Email", size: 20)
        let emailTextField = congigureEmailTextField()
        let errorField1 = getLabelString(text: "Enter valid email", size: 15)
        errorField1.textColor = .red
        errorField1.isHidden = true
        let passwordLabel = getLabelString(text: "Password", size: 20)
        let passwordTextField = congigurePasswordTextField()
        let errorField2 = getLabelString(text: "Enter valid password", size: 15)
        errorField2.textColor = .red
        errorField2.isHidden = true
        loginStack = NSStackView(views: [emailLabe1, emailTextField, errorField1, passwordLabel, passwordTextField, errorField2])
        loginStack.orientation = .vertical
        loginStack.spacing = 20
        loginStack.alignment = .left
        loginForm.addSubview(loginStack)
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        loginForm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginForm.heightAnchor.constraint(equalToConstant: 610),
            loginForm.widthAnchor.constraint(equalToConstant: 490),
            loginForm.centerYAnchor.constraint(equalTo: centerYAnchor),
            NSLayoutConstraint(item: loginForm, attribute: .left, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.2, constant: 0),
            loginStack.centerYAnchor.constraint(equalTo: loginForm.centerYAnchor),
            loginStack.centerXAnchor.constraint(equalTo: loginForm.centerXAnchor)
        ])
        
        let loginButton = configureLoginButton()
        loginForm.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: loginForm.centerYAnchor, constant: 190),
            loginButton.centerXAnchor.constraint(equalTo: loginForm.centerXAnchor)
        ])
        
        
        let string = "Don't have an account?  SignUp"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.foregroundColor, value: NSColor.red, range: NSRange(location: 24, length: 6))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 24, length: 6))
        let signupLabel = getLabelString(text: string , size: 15)
        signupLabel.attributedStringValue = attributedString
        let singleClickRecognizer = NSClickGestureRecognizer(target: self, action: #selector(moveToSignUp(sender:)))
        signupLabel.addGestureRecognizer(singleClickRecognizer)
        singleClickRecognizer.numberOfClicksRequired = 1
        loginForm.addSubview(signupLabel)
        signupLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signupLabel.centerXAnchor.constraint(equalTo: loginForm.centerXAnchor),
            signupLabel.centerYAnchor.constraint(equalTo: loginForm.centerYAnchor, constant: 255)
        ])
        
    }
    
    @objc func moveToSignUp(sender: NSClickGestureRecognizer) {
        loginForm.isHidden = true
        signUpForm.isHidden = false
        window?.makeFirstResponder(signUpForm.nameTextField)
        
    }
    
    @objc func moveToLogin(sender: NSClickGestureRecognizer) {
        signUpForm.isHidden = true
        loginForm.isHidden = false
        
    }
    
    func congigureEmailTextField() -> NSBox {
        
        let borderBox = NSBox()
        emailTextField = NSTextField()
        borderBox.boxType = .custom
        emailTextField.placeholderString = "Enter Your Email"
        emailTextField.isEditable = true
        emailTextField.wantsLayer = true
        emailTextField.isSelectable = true
        emailTextField.isBordered = false
        emailTextField.focusRingType = .none
        emailTextField.usesSingleLineMode = true
        emailTextField.font = .systemFont(ofSize: 20)
        emailTextField.wantsLayer = true
        emailTextField.backgroundColor = .none
        borderBox.contentView = emailTextField
        borderBox.wantsLayer = true
        borderBox.layer?.cornerRadius = 10
        borderBox.borderWidth = 0
        borderBox.layer?.backgroundColor = .black
        emailTextField.translatesAutoresizingMaskIntoConstraints =  false
        borderBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.centerYAnchor.constraint(equalTo: borderBox.centerYAnchor),
            borderBox.widthAnchor.constraint(equalToConstant: 400),
            borderBox.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return borderBox
    }
    
    func congigurePasswordTextField() -> NSBox {
        
        let borderBox = NSBox()
        borderBox.boxType = .custom
        passwordTextField = NSSecureTextField()
        passwordTextField.placeholderString = "Enter Your Password"
        passwordTextField.isEditable = true
        passwordTextField.wantsLayer = true
        passwordTextField.isSelectable = true
        passwordTextField.isBordered = false
        passwordTextField.focusRingType = .none
        passwordTextField.usesSingleLineMode = true
        passwordTextField.font = .systemFont(ofSize: 20)
        passwordTextField.wantsLayer = true
        passwordTextField.backgroundColor = .none
        borderBox.contentView = passwordTextField
        borderBox.wantsLayer = true
        borderBox.layer?.cornerRadius = 10
        borderBox.borderWidth = 0
        borderBox.layer?.backgroundColor = .black
        passwordTextField.translatesAutoresizingMaskIntoConstraints =  false
        borderBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.centerYAnchor.constraint(equalTo: borderBox.centerYAnchor),
            borderBox.widthAnchor.constraint(equalToConstant: 400),
            borderBox.heightAnchor.constraint(equalToConstant: 50)
        ])
        return borderBox
    }
    
    func getLabelString(text: String, size: Int) -> NSTextField {
        
        let textFiled = NSTextField(labelWithString: text)
        textFiled.font = .systemFont(ofSize: CGFloat(size))
        textFiled.isEditable = false
        textFiled.isSelectable = false
        return textFiled
    }
    
    func configureLoginButton() -> NSButton{
        let loginButton = NSButton()
        loginButton.title = "Login"
        loginButton.wantsLayer = true
        loginButton.isBordered = false
        loginButton.alignment = .center
        loginButton.controlSize = .large
        loginButton.contentTintColor = .black
        loginButton.font = .systemFont(ofSize: 25)
        loginButton.layer?.backgroundColor = NSColor.systemOrange.cgColor
        loginButton.layer?.cornerRadius = 20
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        return loginButton
    }
    
   
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func shake(view: NSView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(point: NSPoint(x: view.frame.origin.x - 10, y: view.frame.origin.y))
        animation.toValue = NSValue(point: NSPoint(x: view.frame.origin.x + 10, y: view.frame.origin.y))
        view.layer?.add(animation, forKey: "position")
    }
}
