//
//  ViewController.swift
//  News
//
//  Created by Martín on 16/11/2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var labelOut: UILabel!
    
    @IBOutlet weak var imageDetailOut: UIImageView!
    
    @IBOutlet weak var textViewOut: UITextView!
    
    
    let newsManager = NewsManager()
    var articles: [Article]?
    

    var descriptionText: String = ""
    var labelText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NewsViewModel.selectedArticle?.title
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textViewOut.text = descriptionText
        labelOut.text = labelText
        
    }

    
    
    
}
