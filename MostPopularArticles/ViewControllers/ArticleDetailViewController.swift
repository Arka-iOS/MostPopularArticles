//
//  ArticleDetailViewController.swift
//  MostPopularArticles
//
//  Created by Arka Halder on 03/03/18.
//  Copyright © 2018 Arka Halder. All rights reserved.
//


import UIKit
import WebKit
import MBProgressHUD

class ArticleDetailViewController: UIViewController {
    private let articleURL:String
    private var webView = WKWebView()

    init(articleURL: String) {
        self.articleURL = articleURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        
        if  let url = URL(string: articleURL) {
            webView.load(URLRequest(url: url))
        }
      
    }

    //Error handling
    private func handleError(_ error:Error) {
        MBProgressHUD.hide(for: view, animated: true)
        let alertController = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

// Webview delegates
extension ArticleDetailViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        MBProgressHUD.hide(for: view, animated: true)
        title = webView.title
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        handleError(error)
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        handleError(error)
    }
}

