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
    
    func fetchData(countryId: CountryType,
                   success: @escaping (ArticleList) -> ()) {
        
        let parameters: [String:String] = [
            EndpointsParameters.country.rawValue: countryId.rawValue, EndpointsParameters.apiKey.rawValue: NewsManager.apiKeyValue
        ]
        
        AF.request(Endpoints.headlines.url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { response in
            
            guard let articleList = response.value else {
                print("Se Atasca en Value.")
                return
            }
           
            for articles in articleList.articles {
                print("El titular de esta noticia es: \(articles.title).")

            }
            
            success(articleList)
        }
        
    }
    
}









