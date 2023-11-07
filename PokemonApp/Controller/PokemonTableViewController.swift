//
//  PokemonTableViewController.swift
//  PokemonApp
//
//  Created by Anastasiya Omak on 07/11/2023.
//

import UIKit

class PokemonTableViewController: UITableViewController {

    var pokey: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokemonData()
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
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(Pokemon.self, from: data)
                dump(jsonData)
                self.pokey = jsonData.cards
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("error:::::" , error)
            }
            
        }.resume()
        
    }

// MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return pokey.count
}


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        let poke = pokey[indexPath.row]
        cell.setupUI(withDataFrom: poke)
    
    return cell
}
override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
}


override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "pokemonDetailSegue" {
                guard let destinationVC = segue.destination as? PokemonDetailViewController, let row = tableView.indexPathForSelectedRow?.row else { return
                }
                destinationVC.pokemon = pokey[row]
                
            }
}


}
