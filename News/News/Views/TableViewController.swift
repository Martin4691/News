//
//  UITableViewController.swift
//  News
//
//  Created by Martín on 17/11/2020.
//
import Alamofire
import AlamofireImage
import UIKit
import Foundation

class TableViewController: UITableViewController {
        
    @IBOutlet weak var seachrBarOut: UITextField!
    
    
    let newsManager = NewsManager()
    var article: [Article]?

    
    var currentDescription: String = ""
    var titleDescription: String = ""
    var textForAuthor: String = ""
    var textForDate: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetch headlines para mostrar noticias y everythings para el buscador.
        
      fetchHeadlines()
//        fetchEverything()
    
    }
    
    
    private func fetchHeadlines() {
    newsManager.fetchHeadlines(countryId: CountryType.newZeland,                        success: { (news) in
                            self.article = news.articles
                            self.tableView.reloadData()
        
        print("----separator----")
        print(news.articles.last?.title)
    })
    }

    private func fetchEverything(query: String?) {
        newsManager.fetchEverythings(query: "q", success:{ (news) in
                                    self.article = news.articles
                                    self.tableView.reloadData()
                                    print("-------separador-----")
                                    print(news.articles.last?.title)
                                    })
    }

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
    override func tableView(_ collectionView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
            return article?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if let newsCell = (cell as? NewsCellDetailVC),
            let article: Article = article?[indexPath.row]
        {
            newsCell.labelCellOut.text = article.title
            newsCell.imageCellOut.af.setImage(withURL: URL(string: article.urlToImage!)!)
        } else {
            cell.backgroundColor = .black
        }
        return cell
    }
    
    
    
            // MARK:    - Navigation:

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentDescription = article![indexPath.row].description!
        titleDescription = article![indexPath.row].title!
        textForDate = article![indexPath.row].author!
        textForAuthor =  article![indexPath.row].publishedAt!
        
        NewsViewModel.selectedArticle = article?[indexPath.row]
        
        performSegue(withIdentifier: "goToDetail", sender: nil)
    }
    
    
    // esto fue comentado por CESC para que no usase el parametro a parametro y crease un nuevo newsViewModel.selectedArticle en DetailViewController:
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        if let destinationVC = segue.destination as? DetailViewController {
////            destinationVC.descriptionText = currentDescription
////            destinationVC.labelTextTitle = titleDescription
////            destinationVC.labelTextDate = textForDate
////            destinationVC.labelTextAuthor = textForAuthor
//            destinationVC.articleInDetail = NewsViewModel
//
//        }
//    }
    
    
    @IBAction func seachBarAct(_ sender: Any) {
        
    }
    
}



extension TableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fetchEverything(query: "\(textField.text!)")
        print("Has escrito: \(textField.text!)")
        return true
    }

    
}





