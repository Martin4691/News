//
//  NewsManager.swift
//  News
//
//  Created by Martín on 17/11/2020.
//
import Alamofire
import Foundation

struct NewsManager {
    static let apiKeyValue: String = "ed00ab8445e049039f0e6957f24bc28e"
    
    
    //Calling endpoint "top-headlines".
    
    func fetchHeadlines(countryId: CountryType,
                        success: @escaping (ArticleList) -> ()) {
        
        let parameters: [String:String] = [
            EndpointsParameters.country.rawValue: countryId.rawValue, EndpointsParameters.apiKey.rawValue: NewsManager.apiKeyValue
        ]
        
        AF.request(Endpoints.headlines.url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { response in
            
            guard let articleList = response.value else {
                print("Se Atasca en Value/Headlines.")
                return
            }
            
            for articles in articleList.articles {
                print("El titular de esta noticia es: \(String(describing: articles.title)).")
                
            }
            
            success(articleList)
        }
        
    }
    
    
    func fetchEverythings(query: String,
                          success: @escaping (ArticleList) -> ()) {
        
        let parameters: [String : String] = [
            EndpointsParameters.query.rawValue: query,
            EndpointsParameters.apiKey.rawValue: NewsManager.apiKeyValue
        ]
        
        AF.request(Endpoints.everythings.url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { response in
            
            guard let articleList = response.value else {
                print("Se atasca en Value/Everythings.")
                return
            }
            
            for articles in articleList.articles {
                print("El apartado \"Title\" de Everything nos muestra: \(String(describing: articles.title))")
            }
            
            success(articleList)
        }
        
    }
    

            


    

}
