//
//  DrinksMenuViewController.swift
//  WaterReminder
//
//  Created by Владислав Лихачев on 24.06.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

extension StatusViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "drink", for: indexPath) as! DrinkCollectionViewCell
        cell.backgroundColor = UIColor(hex: "#f19066ff")
        cell.backgroundView?.alpha = 0.4
        //cell.layer.cornerRadius = cell.layer.bounds.width / 2
        cell.nameLabel.text = "\(drinks[indexPath.row])"
        cell.volLabel.text = "\((indexPath.row+1)*50)"
        cell.isUserInteractionEnabled = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        animateDrinksMenu()
        currentVolume+=CGFloat((indexPath.row+1)*50)
    }
    
}

extension StatusViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = (collectionView.frame.width - 5) / 3
        
        return CGSize(width: width, height: width)
    }
}


enum State {
    case closed
    case open
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}
