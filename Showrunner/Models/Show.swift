//
//  Show.swift
//  Showrunner
//
//  Created by ezz on 01/06/2022.
//

import Foundation
struct Show : Codable {
    var name : String
    var language : String?
    var genres : [String]?
    var summary : String?
    var rating : Rating?
    var network  :Network?
    var image : Image?
}

struct Rating : Codable {
    var average : Double?
}
struct Network : Codable {
    var name : String?
    
}
struct Image : Codable {
    var original : String?
}
