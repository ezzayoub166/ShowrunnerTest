//
//  shows.swift
//  Showrunner
//
//  Created by ezz on 31/05/2022.
//

import Foundation


// var urlString = "https://api.tvmaze.com/search/shows?q=alien"
var showArray :
class Shows {
    struct Returned : Codable {
        var show : Show
    }
    var urlString = "https://api.tvmaze.com/search/shows?q="
    var showArray : [Returned] = []
    func getdata(compelted : @escaping() ->()) {
        
        print("we are accessing not creat a URL from \(urlString)")
        
        guard let url = URL(string: urlString) else {
                print("ERROR : Could not creat a URL from \(urlString)")
                compelted()
                return
        }
        
        // creat A URLSession
        let session = URLSession.shared
        
        // het data with .dataTask methood
        let task = session.dataTask(with: url) { (data , response ,error) in
            if let error = error {
                print("ERROR : \(error.localizedDescription)")
            }
            
            // deal with the data
            do {
                self.showArray = try JSONDecoder().decode([Returned].self, from: data!)
                print("Here is what we returned \(self.showArray)")
            }
            catch {
                print("JSON ERROR : \(error.localizedDescription)")
            }
            compelted()
        }
            task.resume()
            
            
        
        
   
}
    
 
    
}
