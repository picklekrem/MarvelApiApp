//
//  CharacterModel.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import Foundation

struct CharacterModel : Decodable {
    let data : Data
}

struct Data : Decodable {
    let results : [Results]
}

struct Results : Decodable {
    let id : Int?
    let name : String?
    let series : Series?
}

struct Series : Decodable {
    
    let available : Int?
}


