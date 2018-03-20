//
//  Article.swift
//  MostPopularArticles
//
//  Created by Arka Halder on 03/03/18.
//  Copyright © 2018 Arka Halder. All rights reserved.
//


import Foundation
import Unbox

struct Article {
    let articleTitle: String
    let articlePublishDate: String
    let articleByLine: String
    let articleURL: String?

}

extension Article: Unboxable {
    init(unboxer: Unboxer) throws {
        self.articleTitle = try unboxer.unbox(key: "title")
        self.articlePublishDate = try unboxer.unbox(key: "published_date")
        self.articleByLine = try unboxer.unbox(key: "byline")
        self.articleURL = unboxer.unbox(key: "url")
    }
}
