//
//  ViewController.swift
//  News
//
//  Created by Martín on 16/11/2020.
//
import Alamofire
import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTotalResults()
        fetchAuthor()
        
    }
    
    func fetchTotalResults() {
        
        let parameters = ["country" : "us", "apiKey" : "ad744c6e7c234011ad5decae4f173e16"]
        AF.request(Endpoints.headlines.url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { response in
            
            guard let articles: ArticleList = response.value else {
                print(String(describing: response.error))
                return
            }
            print("Hay: \(articles.totalResults) Total Results.")
        }
    }
    
    func fetchAuthor() {
        let parameters = ["country" : "us", "apiKey" : "ad744c6e7c234011ad5decae4f173e16"]
        AF.request(Endpoints.headlines.url, parameters: parameters).validate().responseDecodable(of: Articles.self) { response in
            
            guard let authors: Articles = response.value else {
                print(String(describing: response.error))
                return
            }
            
            
            for author in authors.source.name! {
            print("Aparecen los siguientes autores: \(author) ")
        }
    }
  
}




}
