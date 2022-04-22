//
//  TableViewCell.swift
//  RickAndMorty
//
//  Created by Сергей Веретенников on 19/04/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var isAlive: UILabel!
    
    @IBOutlet weak var picture: CachedImage! {
        didSet {
            
            self.picture.contentMode = .scaleAspectFill
            
            self.picture.layer.cornerRadius = self.picture.frame.height / 2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setValuesForCell(from character: Character) {
        
        self.fullName.text = character.name
        self.species.text = character.species
        self.isAlive.text = character.status
        
        
        if character.status == "Alive" {
            self.isAlive.textColor = .green
        } else if character.status == "Dead" {
            self.isAlive.textColor = .red
        } else {
            self.isAlive.textColor = .gray
        }
        
    }
    
    func setPics(from character: Character) {
        
        self.picture.fetchImage(from: character.image)
        
    }
}
