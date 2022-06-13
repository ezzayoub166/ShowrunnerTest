//
//  DetailVC.swift
//  Showrunner
//
//  Created by ezz on 01/06/2022.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var RatingLabel: UILabel!
    
    @IBOutlet weak var NetWorklLable: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    
    @IBOutlet weak var GenresLabel: UILabel!
    
    
    @IBOutlet weak var DescriptionLabel: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var show : Show!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupdata()
        fetchdata()
       
        
    }

}
extension DetailVC {
    func setUpView(){
        
    }
    func setupdata(){
        
    }
    func fetchdata(){
        guard show != nil else  {
            print("!!! show is nil in DetialVC should NEVER happen")
            return
            
        }
        updateUserInterface()
        
    }
    func  updateUserInterface(){
        NameLabel.text = show.name
        languageLabel.text = show.language ?? ""
        show.summary = show.summary?.replacingOccurrences(of: "<[^>]+>", with: "" , options: .regularExpression , range: nil)
        
        NetWorklLable.text = show.network?.name ?? ""
        DescriptionLabel.text = show.summary ?? ""
        
        
        if let rating = show.rating?.average {
            RatingLabel.text = "\(rating)"
        }
        else {
            RatingLabel.text = "-"

        }
        var generlist  = ""
        if show.genres != nil {
            for genre in show.genres! {
                generlist += "\(genre)\n"
            }
            if generlist != ""{
                generlist.removeLast()
            }
        }
            GenresLabel.text = generlist
        guard let url = URL(string: show.image?.original ?? "" ) else{
            return
        }
        do {
            let data = try Data(contentsOf: url)
            imageView.image = UIImage(data: data)
        }
        catch{
            print("😡 ERROR: Could not get image from url \(url)")
        }
 
        
    }
}
