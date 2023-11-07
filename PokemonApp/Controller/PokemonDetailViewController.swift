//
//  PokemonDetailViewController.swift
//  PokemonApp
//
//  Created by Anastasiya Omak on 07/11/2023.
//

import UIKit
import SDWebImage

class PokemonDetailViewController: UIViewController {
    
    var pokemon: Card?
    
    @IBOutlet weak var pokemonsImage: UIImageView!
    
    @IBOutlet weak var pokemonsName: UILabel!
    
    @IBOutlet weak var pokemonsID: UILabel!
    
    @IBOutlet weak var pokemonsType: UILabel!
    
    @IBOutlet weak var pokemonsHP: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonsImage.sd_setImage(with: URL(string: pokemon!.imageURL))
        pokemonsName.text = pokemon?.name
        pokemonsID.text = pokemon?.id
        pokemonsType.text = pokemon?.supertype
        pokemonsHP.text = pokemon?.hp
        
    }
    
}
