//
//  DrinkCollectionViewCell.swift
//  WaterReminder
//
//  Created by Владислав Лихачев on 24.06.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

class DrinkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var volLabel: UILabel!
    override func layoutSubviews() {
        self.isUserInteractionEnabled = true
    }

}


