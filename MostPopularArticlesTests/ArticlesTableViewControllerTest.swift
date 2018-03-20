//
//  ArticlesTableViewControllerTest.swift
//  MostPopularArticlesTests
//
//  Created by Arka Halder on 03/03/18.
//  Copyright © 2018 Arka Halder. All rights reserved.
//

import XCTest

class ArticlesTableViewControllerTest: XCTestCase {
    let sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ArticlesTableViewController")

    override func setUp() {
        super.setUp()
        sut.performSelector(onMainThread: #selector(ArticlesTableViewController.loadView), with: nil, waitUntilDone: true)
        sut.performSelector(onMainThread: #selector(ArticlesTableViewController.viewDidLoad), with: nil, waitUntilDone: true)    }
    
    func testHasNoAmbigouLayouts () {
        XCTAssertFalse(sut.view.hasAmbiguousLayout)
    }
    
    func testViewControllerConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        
    }
    
   
    
}
