//
//  ViewController.swift
//  PokemonApp
//
//  Created by Anastasiya Omak on 06/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var pokey: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokemonData()
        // Do any additional setup after loading the view.
    }
    
    func loadPokemonData(){
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        
        guard let url = URL(string: jsonUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { data, response, error in
            if error != nil {
                print((error?.localizedDescription)!)
            }
            dump(response)
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(Pokemon.self, from: data)
                dump(jsonData)
                self.pokey = jsonData.cards
                
            } catch {
                print("error:::::" , error)
            }
            
        }.resume()
        
    }
}
