//
//  ArticleTest.swift
//  MostPopularArticlesTests
//
//  Created by Arka Halder on 03/03/18.
//  Copyright © 2018 Arka Halder. All rights reserved.
//

import XCTest
import Unbox

class ArticleTest: XCTestCase {
    
    func testModle() {
        let json = ["title":"abc", "published_date":"2012-04-06","byline":"xyz","url":"www.abcxyz.com"]
        do {
            let articel:Article = try unbox(dictionary:json)
            XCTAssertEqual(articel.articleTitle, "abc")
            XCTAssertEqual(articel.articlePublishDate, "2012-04-06")
            XCTAssertEqual(articel.articleByLine, "xyz")
            XCTAssertEqual(articel.articleURL, "www.abcxyz.com")
            
        } catch {
            XCTAssert(false)
        }
    }
    
}
