//
//  SafeArray.swift
//  MostPopularArticles
//
//  Created by Arka Halder on 03/03/18.
//  Copyright © 2018 Arka Halder. All rights reserved.
//

import Foundation

extension Collection {
    //Use this subscript to avoid over indexing.
    subscript (safe index: Index) -> Iterator.Element? {
        return index >= startIndex && index < endIndex ? self[index] : nil
    }
}
