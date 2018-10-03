//
//  ViewController.swift
//  TestTask
//
//  Created by Alexander Zemlyansky on 9/25/18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    // MARK: - Outlet
    
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var consTop: NSLayoutConstraint!
    
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.errorView.isHidden = true
        self.consTop.constant = 10
        self.numberView.layer.cornerRadius = 8;
        self.passwordTextField.layer.cornerRadius = 8;
        self.logInButton.layer.cornerRadius = 8;
        self.logInButton.layer.borderWidth = 1
        self.logInButton.layer.borderColor = UIColor.gray.cgColor
        
    }
    // MARK: - EndEditing
    @IBAction func loginEndEditing(_ sender: UITextField) {
        guard let numbertext = numberTextField.text else {
            return
        }
        guard let passwordtext = passwordTextField.text else {
            return
        }
        if (numbertext.isEmpty == false && passwordtext.isEmpty == false)  {
            logInButton.backgroundColor = UIColor(red:56/255 , green: 151/255, blue: 241/255, alpha: 1)
            logInButton.titleLabel?.textColor = UIColor.white
            
        }
    }
    @IBAction func passwordEndEditing(_ sender: UITextField) {
        guard let numbertext = numberTextField.text else {
            return
        }
        guard let passwordtext = passwordTextField.text else {
            return
        }
        if (numbertext.isEmpty == false && passwordtext.isEmpty == false)  {
            logInButton.backgroundColor = UIColor(red:56/255 , green: 151/255, blue: 241/255, alpha: 1)
            logInButton.titleLabel?.textColor = UIColor.white
            
        }
    }
    // MARK: - Action
    @IBAction func logIn(_ sender: UIButton) {
        guard let numbertext = numberTextField.text else {
            return
        }
        guard let passwordtext = passwordTextField.text else {
            return
        }
        if (numbertext != "961235555" || passwordtext != "text"){
            DispatchQueue.main.async() {
                self.errorView.isHidden = false
                self.consTop.constant = 80
                self.logInButton.backgroundColor = UIColor(red:56/255 , green: 151/255, blue: 241/255, alpha: 1)
                self.logInButton.titleLabel?.textColor = UIColor.white
            }
        }
    }
}

