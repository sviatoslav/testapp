//
//  UIManeger.swift
//  TestTask
//
//  Created by Alexander Zemlyansky on 10/3/18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

@objc protocol UpdateUserData {
    @objc optional func getFotoProfile(url:String) -> UIImage?
    func updateUI()
}

extension UpdateUserData{
    func getFotoProfile(url:String) -> UIImage? {
        let url = URL(string: url)
        let data = try? Data(contentsOf: url!)
        let image : UIImage? = UIImage(data: data!)
        return image
    }
}

