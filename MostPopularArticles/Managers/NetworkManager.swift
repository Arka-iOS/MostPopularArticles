//
//  NetworkManager.swift
//  MostPopularArticles
//
//  Created by Arka Halder on 03/03/18.
//  Copyright © 2018 Arka Halder. All rights reserved.
//

import UIKit
import Alamofire
import Unbox

typealias ServiceError = (Error?) -> Void

class NetworkManager: NSObject {
    static let sharedManager = NetworkManager()
    private let appURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=3167ba2a4694476cb67d5d5189527701"
    
    //Get latest articles
    func getMostPopularArticles(_ success: @escaping ([Article]) -> Void, failure: @escaping ServiceError) {
        guard let url = URL(string: appURL) else {
            return
        }
      
        Alamofire.request(url,method: .get,parameters: nil).validate().responseJSON
            { (response) -> Void in
                guard response.result.isSuccess else {
                    failure(response.result.error)
                    return
                }
                guard let value = response.result.value as? [String: Any] else {
                    failure(nil)
                    return
                }
                do {
                    if let results = value["results"] as? [[String: Any]] {
                        var articles = [Article]()
                        for result in results {
                            let article: Article = try unbox(dictionary: result)
                            articles.append(article)
                        }
                        success(articles)
                    } else {
                        failure(nil)
                        
                    }
                } catch {
                    failure(error as Error)
                }
                
        }
        
    }
    
}
