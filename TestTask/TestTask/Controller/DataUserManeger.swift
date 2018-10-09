//
//  DataUserManeger.swift
//  TestTask
//
//  Created by Alexander Zemlyansky on 10/9/18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit
import CoreData

func saveDataUser(login:String, password:String) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext = appDelegate.persistentContainer.viewContext
    let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
    let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
    user.setValue(login, forKeyPath: "login")
    user.setValue(password, forKey: "password")
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

func getDataUser() -> (login: String, password: String){
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    request.returnsObjectsAsFaults = false
    do {
        let result = try managedContext.fetch(request)
        for data in result as! [NSManagedObject] {
            let login = data.value(forKey: "login") as! String
            let password = data.value(forKey: "password") as! String
            return (login,password)
        }

    } catch {
        return ("","")
    }
    return ("","")
}
