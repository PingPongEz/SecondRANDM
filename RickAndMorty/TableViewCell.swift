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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //mark
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setValuesForCell(from character: Character) {
        self.fullName.text = character.name
        self.species.text = character.species
        self.isAlive.text = character.status
    }
}
