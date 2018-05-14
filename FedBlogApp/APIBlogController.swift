//
//  APIBlogController.swift
//  FedBlogApp
//
//  Created by Руслан Федорович on 14.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import Foundation
import Unbox
import Alamofire

func fetchPosts(completionHandler: @escaping ([Post]?) -> Void) {
    let url = mainURL
    Alamofire.request(url).responseData(completionHandler: {response in
        if let data = response.data, let posts: [Post] = try? unbox(data: data) {
            completionHandler(posts)
        } else {print("Posts data wasn't unwrapped or unboxed")
            completionHandler(nil)
        }
    })
}

func fetchFullPost(id: Int, completionHandler: @escaping (Post?) -> Void) {
    let path: [String] = [String(id)]
    let url = mainURL.withAdditionalPath(path: path)!
    Alamofire.request(url).responseData(completionHandler: {response in
        if let data = response.data, let fullPost: Post = try? unbox(data: data) {
            completionHandler(fullPost)
        } else {print("Full post data wasn't unwrapped or unboxed")
            completionHandler(nil)
        }
    })
}

func fetchMarks(id: Int, completionHandler: @escaping ([Mark]?) -> Void) {
    let path: [String] = [String(id), "marks"]
    let url = mainURL.withAdditionalPath(path: path)!
    Alamofire.request(url).responseData(completionHandler: {response in
        if let data = response.data, let mark: [Mark] = try? unbox(data: data) {
            completionHandler(mark)
        } else {print("Marks data wasn't unwrapped or unboxed")
            completionHandler(nil)
        }
    })
}


