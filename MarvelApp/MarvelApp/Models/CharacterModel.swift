//
//  CharacterModel.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import Foundation

struct CharacterModel : Decodable {
    let data : Datas
}

struct Datas : Decodable {
    let results : [Results]
}

struct Results : Decodable {
    let id : Int?
    let name : String?
    let series : Count?
    let comics : Count?
    let stories : Count?
    let events : Count?
    var thumbnail : [String:String]
    var urls : [[String:String]]
}

struct Count : Decodable {
    let available : Int?
    let items : [ItemNames]
}

struct ItemNames : Decodable {
    let name : String?
}


