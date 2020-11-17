//
//  endpoints.swift
//  News
//
//  Created by Martín on 16/11/2020.
//

import Foundation

enum Endpoints: String {
    case headlines = "https://newsapi.org/v2/top-headlines"
    case everythings
    
    var url: String { self.rawValue }
    
}


enum EndpointsParameters: String {
    case country, apiKey, source, page
    case query = "q"

}







