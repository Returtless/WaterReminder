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
    weak var delegate: DrinksCollectionViewDelegate?
    
    override func layoutSubviews() {
        //let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.isUserInteractionEnabled = true
      //  self.addGestureRecognizer(tapGestureRecognizer)
      //  tapGestureRecognizer.cancelsTouchesInView = false
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
      {
        delegate!.onButtonTapped("")
      }
}


