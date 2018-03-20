//
//  ArticlesTableViewController.swift
//  MostPopularArticles
//
//  Created by Arka Halder on 03/03/18.
//  Copyright © 2018 Arka Halder. All rights reserved.
//

import UIKit
import MBProgressHUD

class ArticlesTableViewController: UITableViewController {
    
    private var dataSource = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.separatorStyle = .none
        getAllArticles()
    }
    
    private func getAllArticles() {
        MBProgressHUD.showAdded(to: view, animated: true)
        NetworkManager.sharedManager.getMostPopularArticles({ [unowned self] (articles) in
            self.dataSource = articles
            MBProgressHUD.hide(for: self.view, animated: true)
            self.tableView.reloadData()
            }, failure: { [unowned self] (error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                let alertController = UIAlertController(title: nil, message: error?.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [weak self](action) in
                    self?.getAllArticles()
                }))
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
        })
    }
}

// Tableview datasource and delegates
extension ArticlesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        if let article = dataSource[safe:indexPath.row] {
            cell.set(article)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = dataSource[safe:indexPath.row], let url = article.articleURL else {
            return
        }
        let detailController = ArticleDetailViewController(articleURL: url)
        navigationController?.pushViewController(detailController, animated: true)
        
    }
}
