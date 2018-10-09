//
//  UserDataJSON.swift
//  TestTask
//
//  Created by Alexander Zemlyansky on 10/7/18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit


final class UserData: NSObject {
    
    let imageURL: String
    lazy var imageProfile: UIImage? = nil
    let firstName: String
    let lastName: String
    
    init(imageURL:String, firstName:String, lastName:String) {
        self.imageURL = imageURL
        self.firstName = firstName
        self.lastName = lastName
    }
}



