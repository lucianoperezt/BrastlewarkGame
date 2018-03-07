//
//  InhabitanTableViewCell.swift
//  BrastlewarkGame
//
//  Created by Luciano Perez Tiranti on 02/03/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import UIKit

/*
 * Class that represents a custom cell for an inhabitan result
 */
class InhabitanTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var friends: UILabel!
    @IBOutlet weak var professions: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
