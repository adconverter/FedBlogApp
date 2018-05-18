//
//  CommentsController.swift
//  FedBlogApp
//
//  Created by Руслан Федорович on 18.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

func submitComment(text: String, idPost: Int, completionHandler: @escaping (Int?) -> Void) {
    let idUser = 1
    let commentURL = URL(string: "http://fed-blog.herokuapp.com/api/v1/comments")!
    let parameters: [String: Any] = [
        "text": text,
        "idPost": idPost,
        "idUser": idUser
    ]
    request(commentURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: {responseJSON in
        guard let statusCode = responseJSON.response?.statusCode else {
            completionHandler(nil)
            return
        }
        completionHandler(statusCode)
    })
}

func fetchComments(id: Int, completionHandler: @escaping ([Comment]?) -> Void) {
    let path = ["posts", String(id)]
    let commentURL = URL(string: "http://fed-blog.herokuapp.com/api/v1/comments")!.withAdditionalPath(path: path)!
    Alamofire.request(commentURL).responseData(completionHandler: {response in
        if let data = response.data, let comments: [Comment] = try? unbox(data: data) {
            completionHandler(comments)
        } else {print("Comments data wasn't unwrapped or unboxed, \(commentURL)")
            completionHandler(nil)
        }
    })
}


