//
//  Articles.swift
//  News
//
//  Created by Martín on 16/11/2020.
//

import Foundation

struct Article: Decodable {
    
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    var publishedAtFormatted: String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: publishedAt!) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MMM-YY"
                return dateFormatter.string(from: date)
            } else {
                return publishedAt!
            }
        }
    
    
    
}



