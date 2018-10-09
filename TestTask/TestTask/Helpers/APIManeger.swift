//
//  APIManeger.swift
//  TestTask
//
//  Created by Alexander Zemlyansky on 10/3/18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import Foundation


func getUserData(completion: @escaping (_ userData: UserData) -> Void) {
    
    var strSunrise = "https://reqres.in/api/users/2"
    strSunrise = strSunrise.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    var urlRequest = URLRequest(url: URL(string: strSunrise)!)
    urlRequest.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, resopnse, error) in
        guard let responseData = data else {
            print("Error data")
            return
        }
        let json = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
        guard let jsonUser = json as? Dictionary<String, AnyObject> else {
            print("Error data")
            return
        }
        guard let dictionaryUser = jsonUser["data"] as? Dictionary<String, AnyObject> else {
            print("Error data")
            return
        }

        let userData = UserData(imageURL: dictionaryUser["avatar"] as! String, firstName: dictionaryUser["first_name"] as! String, lastName: dictionaryUser["last_name"] as! String)
        completion(userData)
    }
    task.resume()
}

