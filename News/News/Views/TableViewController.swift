//
//  UITableViewController.swift
//  News
//
//  Created by Martín on 17/11/2020.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
        
    let newsManager = NewsManager()
    var articles: [Articles]?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHeadlines()
        
        
        
    }
    
    private func fetchHeadlines() {
    newsManager.fetchData(countryId: CountryType.newZeland,                        success: { (news) in
                            self.articles = news.articles
                            self.tableView.reloadData()
        
        print("----separator----")
        print(news.articles.last?.title)
    })
    }



        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
    override func tableView(_ collectionView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
            return articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if let newsCell = (cell as? NewsCellDetailVC),
            let article: Articles = articles?[indexPath.row]
        {
            newsCell.labelCellOut.text = article.title
        
        } else {
            cell.backgroundColor = .black
        }
        return cell
    }
    
    
    
}
