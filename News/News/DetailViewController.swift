//
//  ViewController.swift
//  News
//
//  Created by Martín on 16/11/2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var labelTitleOut: UILabel!
    @IBOutlet weak var imageDetailOut: UIImageView!
    @IBOutlet weak var textViewOut: UITextView!
    @IBOutlet weak var labelAuthorOut: UILabel!
    @IBOutlet weak var labelDateOut: UILabel!
    @IBOutlet weak var safariButtonOut: UIButton!
    
    
    let newsManager = NewsManager()
    var articles: [Article]?
    
    
    //    var descriptionText: String = ""
    //    var labelTextTitle: String = ""
    //    var labelTextDate: String = ""
    //    var labelTextAuthor: String = ""
    //    var articleInDetail: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NewsViewModel.selectedArticle?.source.name
        configureView()
        
    }
    
    // Los datos/nombres de date y auhtor estan cruzados.
    //    override func viewWillAppear(_ animated: Bool) {
    //        textViewOut.text = descriptionText
    //        labelTitleOut.text = labelTextTitle
    //        labelDateOut.text = labelTextAuthor
    //        labelAuthorOut.text = labelTextDate
    //
    //    }
    
    private func configureView() {
        guard let article: Article = NewsViewModel.selectedArticle else { return }
        labelTitleOut.text = article.title
        labelDateOut.text = article.publishedAtFormatted
        labelAuthorOut.text = article.author
        textViewOut.text = article.description
        
        if let urlToImage = article.urlToImage,
           let url = URL(string: urlToImage ) {
            imageDetailOut.af.setImage(withURL: url)
        }
    }
    
    @IBAction func safariButtonAct(_ sender: Any) {
        guard let article: Article = NewsViewModel.selectedArticle else { return }
        if let url = URL(string: article.url ?? "NO WEB LINK" ) {
            UIApplication.shared.open(url)
        }
        
    }
    
    
    
    
    
    
    
    
}
