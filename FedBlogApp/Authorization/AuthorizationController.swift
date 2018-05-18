//
//  AuthorizationController.swift
//  FedBlogApp
//
//  Created by Руслан Федорович on 17.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import Foundation
import Alamofire



func login(name: String, password: String, completionHandler: @escaping (Int?) -> Void) {
    let loginURL = URL(string: "http://fed-blog.herokuapp.com/api/v1/security/login")!
    let parameters = ["name": name, "password": password]
    request(loginURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: {responseJSON in
        guard let statusCode = responseJSON.response?.statusCode else {
            completionHandler(nil)
            return
        }
        completionHandler(statusCode)
    })
}

func logout(_ completionHandler: @escaping (Int?) -> Void) {
    let logoutURL = URL(string: "http://fed-blog.herokuapp.com/api/v1/security/logout")!
    request(logoutURL).responseJSON(completionHandler: {responseJSON in
        guard let statusCode = responseJSON.response?.statusCode else {
            completionHandler(nil)
            return
        }
        completionHandler(statusCode)
    })
}


