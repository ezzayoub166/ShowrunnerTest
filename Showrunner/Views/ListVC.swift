//
//  ListVC.swift
//  Showrunner
//
//  Created by ezz on 31/05/2022.
//

import UIKit

class ListVC: UIViewController {
    
    var shows = Shows()

    @IBOutlet weak var segementedContol: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        shows.urlString += searchText
        
        shows.getdata {
            DispatchQueue.main.async {
                self.sortTable()
                
                
            }
            
        }

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destanation = segue.destination as! DetailVC
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        destanation.show = shows.showArray[selectedIndexPath.row].show
    }
    
    func sortTable(){
        switch segementedContol.selectedSegmentIndex {
        case 0 :
            shows.showArray.sort(by: {$0.show.name < $1.show.name})
        case 1 :
            shows.showArray.sort(by: {$0.show.rating?.average ?? 0.0 > $1.show.rating?.average ?? 0.0 })
        default:
            print("ERROR : This Should never happen")
        }
        tableView.reloadData()
    }
 	
    @IBAction func segementedContol(_ sender: Any){
        sortTable()
    }
    
}
extension ListVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.showArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shows.showArray[indexPath.row].show.name
        if let rating = shows.showArray[indexPath.row].show.rating?.average{
            cell.detailTextLabel?.text = "\(rating)"
        }
        else{
            cell.detailTextLabel?.text = "-"
        }
        return cell
    
    }
  
    
    
}
