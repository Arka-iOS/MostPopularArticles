//
//  ArticleTableViewCell.swift
//  MostPopularArticles
//
//  Created by Arka Halder on 03/03/18.
//  Copyright © 2018 Arka Halder. All rights reserved.
//


import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articcleDate: UILabel!
    @IBOutlet weak var articleBy: UILabel!
    
    func set(_ article:Article) {
        articleTitle.text = article.articleTitle
        articleBy.text = article.articleByLine
        articcleDate.text = article.articlePublishDate
    }
}
