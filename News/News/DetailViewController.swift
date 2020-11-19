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
    
    
    let newsManager = NewsManager()
    var articles: [Article]?
    

    var descriptionText: String = ""
    var labelTextTitle: String = ""
    var labelTextDate: String = ""
    var labelTextAuthor: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NewsViewModel.selectedArticle?.source.name
        
        
    }
    
    // Los datos/nombres de date y auhtor estan cruzados.
    override func viewWillAppear(_ animated: Bool) {
        textViewOut.text = descriptionText
        labelTitleOut.text = labelTextTitle
        labelDateOut.text = labelTextAuthor
        labelAuthorOut.text = labelTextDate
        
    }

    
    
    
}
