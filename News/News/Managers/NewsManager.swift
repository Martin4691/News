//
//  NewsManager.swift
//  News
//
//  Created by Martín on 17/11/2020.
//
import Alamofire
import Foundation

struct NewsManager {
    static let apiKeyValue: String = "ad744c6e7c234011ad5decae4f173e16"
    
    //Calling endpoint "top-headlines".
    
    func fetchData() {
        
        let parameters = ["country":"us", "apiKey":"ad744c6e7c234011ad5decae4f173e16"]
        
        AF.request(Endpoints.headlines.url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { response in
            
            guard let numOfResults: ArticleList = response.value else {
                print("Se Atasca en Value.")
                return
            }
            let printResults: String = "Hay: \(numOfResults.totalResults) resultados."
            print(printResults)
            
        }
        
    }
    
}









