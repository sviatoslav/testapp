//
//  ProfileViewController.swift
//  TestTask
//
//  Created by Alexander Zemlyansky on 10/7/18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var ImageProfile: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    weak var delegate : ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstNameText = delegate?.userData?.firstName{
           self.firstName.text = firstNameText
        }
        if let lastNameText = delegate?.userData?.lastName{
            DispatchQueue.main.async() {
                self.lastName.text = lastNameText
            }
        }
        if let Image = delegate?.userData?.imageProfile{
            self.ImageProfile.image = Image
        }
    }
    @IBAction func BackButton(_ sender: UIButton) {
        delegate?.updateUI()
        self.dismiss(animated: true, completion: nil)
    }
    
}
