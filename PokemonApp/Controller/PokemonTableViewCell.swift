//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by Anastasiya Omak on 07/11/2023.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonType: UILabel!
    
    @IBOutlet weak var pokemonPoint: UILabel!
    
    @IBOutlet weak var pokemonRarity: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
    }
    func setupUI(withDataFrom: Card){
        
        pokemonName.text = "Name: " + withDataFrom.name
        pokemonRarity.text = "Rarity: " + (withDataFrom.rarity ?? "0")
        pokemonPoint.text = "HP: " + (withDataFrom.hp ?? "")
        pokemonImageView.sd_setImage(with: URL(string: withDataFrom.imageURL))
        pokemonType.text = "Type: " + (withDataFrom.supertype ?? "")
        
        
        
    }
}
