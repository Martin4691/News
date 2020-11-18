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
    
}



