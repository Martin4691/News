//
//  movies.swift
//  News
//
//  Created by Martín on 23/11/2020.
//

import Foundation


struct Movie: Decodable {
    let title: String
    let releaseYear: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseYear = "release_year"
        // Con esto quitamos la barra baja a release_year por la mayuscula que es la forma de escribir en Swift.
        
    }
        
    
}











