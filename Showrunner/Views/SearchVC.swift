//
//  SearchVC.swift
//  Showrunner
//
//  Created by ezz on 02/06/2022.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var SearchLabel: UILabel!
    
    @IBOutlet weak var SearchTextFiled: UITextField!
    
    
    @IBOutlet weak var SearchButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var searchText = SearchTextFiled.text!
        searchText = searchText.replacingOccurrences(of: " ", with: "20%")
        let destination = segue.destination as! ListVC
        destination.searchText = searchText
    }
    
  
    
}
