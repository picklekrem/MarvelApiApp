//
//  Service.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import Foundation


final class Service {
    
    static let shared = Service()
    
    enum ServiceError : Error {
        case failedToGetData
    }
    
    func getCharacterList(offSet : Int, completion : @escaping (CharacterModel) -> Void) {
        guard let url = URL(string: Constants.baseUrl + "characters?offset=\(offSet)&ts=" + Constants.timeStamp + "&apikey=" + Constants.apiKey + "&hash=" + Constants.hash) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription)
                return
            }
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let result =  try JSONDecoder().decode(CharacterModel.self, from: data)
                completion(result)
            } catch  {
                print(ServiceError.failedToGetData)
            }
        }.resume()
    }
    
    
}
