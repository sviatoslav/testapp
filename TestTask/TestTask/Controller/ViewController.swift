//
//  ViewController.swift
//  TestTask
//
//  Created by Alexander Zemlyansky on 9/25/18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UpdateUserData {
    
    
    var Storybord = UIStoryboard(name: "Main", bundle: nil)
    var userData : UserData? = nil
    
    // MARK: - Outlet
    
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var consTop: NSLayoutConstraint!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ActivityIndicator.alpha = 0
        self.errorView.alpha = 0
        self.consTop.constant = 10
        self.numberView.layer.cornerRadius = 8;
        self.passwordTextField.layer.cornerRadius = 8;
        self.logInButton.layer.cornerRadius = 8;
        self.logInButton.layer.borderWidth = 1
        self.logInButton.layer.borderColor = UIColor.gray.cgColor
        let authorizationData = getDataUser()
        numberTextField.text = authorizationData.login
        passwordTextField.text = authorizationData.password
        
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
        if (numbertext != "961235555" || passwordtext != "test"){
            UIView.animate(withDuration: 0.5, animations: {
                self.errorView.alpha = 1
                self.consTop.constant = 80
            })
            DispatchQueue.main.async() {
                self.logInButton.backgroundColor = UIColor(red:56/255 , green: 151/255, blue: 241/255, alpha: 1)
                self.logInButton.titleLabel?.textColor = UIColor.white
            }
        }else{
            saveDataUser(login: numbertext, password: passwordtext)
            self.ActivityIndicator.alpha = 1
            getUserData(completion: { userData in
                self.userData = userData
                self.userData?.imageProfile = self.getFotoProfile(url: userData.imageURL)
                DispatchQueue.main.async() {
                    let ProfileViewController = self.Storybord.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
                    ProfileViewController.delegate = self
                    self.present(ProfileViewController, animated: true, completion:nil)
                    self.ActivityIndicator.alpha = 0
                }
            })
        }
    }
    @IBAction func HelpButton(_ sender: UIButton) {
        
        let HelpViewController = Storybord.instantiateViewController(withIdentifier: "HelpVC") as! HelpViewController
        self.present(HelpViewController, animated: true, completion:nil)
    }
    
    
    @IBAction func RegistrationButton(_ sender: UIButton) {
        
        let HelpViewController = Storybord.instantiateViewController(withIdentifier: "HelpVC") as! HelpViewController
        self.present(HelpViewController, animated: true, completion:nil)
    }
    
    func updateUI(){
        self.numberTextField.text = ""
        self.passwordTextField.text = ""
        self.logInButton.backgroundColor = self.view.backgroundColor
        self.consTop.constant = 20
        self.errorView.alpha = 0
    }
    
    
    
}
