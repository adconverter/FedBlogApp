//
//  Comment.swift
//  FedBlogApp
//
//  Created by Руслан Федорович on 18.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import Foundation
import Unbox
struct Comment {
    var author: String?
    var datePublic: String?
    var id: Int?
    var text: String?
    }

extension Comment: Unboxable {
    init(unboxer: Unboxer) throws {
        self.author = try unboxer.unbox(key: "author")
        self.datePublic = try unboxer.unbox(key: "datePublic")
        self.id = try unboxer.unbox(key: "id")
        self.text = try unboxer.unbox(key: "text")
        }
}
