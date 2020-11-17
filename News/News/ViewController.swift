//
//  ViewController.swift
//  News
//
//  Created by Martín on 16/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    let newsManager = NewsManager()
    var articles: [Articles]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsManager.fetchData()
        
    }

 

}
