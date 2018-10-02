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
    
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numberView.layer.cornerRadius = 8;
        self.passwordTextField.layer.cornerRadius = 8;
        self.logInButton.layer.cornerRadius = 8;
        self.logInButton.layer.borderWidth = 1
        self.logInButton.layer.borderColor = UIColor.gray.cgColor
        
    }
    // MARK: - EndEditing
    @IBAction func loginEndEditing(_ sender: UITextField) {
        updateButtonColor()
    }
    @IBAction func passwordEndEditing(_ sender: UITextField) {
        updateButtonColor()
    }
    
    
    @IBAction func logIn(_ sender: UIButton) {
        
    }
    
    
    
    func updateButtonColor() {
        if ((numberTextField.text?.isEmpty)! == false && (passwordTextField.text?.isEmpty)! == false)  {
            self.logInButton.backgroundColor = UIColor(red:56/255 , green: 151/255, blue: 241/255, alpha: 1)
            self.logInButton.titleLabel?.textColor = UIColor.white
            
        }
    }
    
}

