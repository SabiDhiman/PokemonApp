//
//  pokemonAPI.swift
//  PokemonApp
//
//  Created by Dhiman, Sabi (Consumer Servicing & Engagement Platform) on 19/02/2023.
//

import UIKit

final class PokemonAPI {
    //create instance of api to use same instance
    static let shared = PokemonAPI()

    
    func fetchPokemonList(onCompletion: @escaping ([Pokemon]) -> ()){
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        let url = URL(string: urlString)!
      
        URLSession.shared.dataTask(with: url) {
            (data,response,error) in
            //unwrap optional
          
            guard let data = data?.parseData(removeString: "null,") else {
                print("data is nil")
                return
            }
            //decode json
            
            guard let pokemonList = try? JSONDecoder().decode([Pokemon].self, from: data)
          
            else {
                print("couldnt decode json")
                return
            }
            onCompletion(pokemonList)
            print(pokemonList)
            print(data)
         
            
        }.resume()
    }
  
    }
    
extension Data{
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString  = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {return nil}
        return data
    }
}



struct Pokemon: Decodable, Identifiable {
   
    let attack: Int?
    let defence: Int?
    let description: String?
    let height: Int?
    let id: Int?
    let imageUrl: String?
    let name: String?
    let type: String?
    let weight: Int?
    
}


/*
 {
             "amiiboSeries": "Super Smash Bros.",
             "character": "Mario",
             "gameSeries": "Super Mario",
             "head": "00000000",
             "image": "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png",
             "name": "Mario",
             "release": {
                 "au": "2014-11-29",
                 "eu": "2014-11-28",
                 "jp": "2014-12-06",
                 "na": "2014-11-21"
             },
             "tail": "00000002",
             "type": "Figure"
         },
 */

