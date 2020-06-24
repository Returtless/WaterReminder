//
//  SettingsButton.swift
//  WaterReminder
//
//  Created by Владислав Лихачев on 24.06.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

class SettingsButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
        layer.shadowColor = UIColor(hex: "#f78fb3ff")?.cgColor
                     // layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                      layer.shadowOpacity = 1
                      layer.shadowRadius = 5.0
        //layer.masksToBounds = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
        layer.shadowColor = UIColor(hex: "#f78fb3ff")?.cgColor
              // layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
               layer.shadowOpacity = 1
               layer.shadowRadius = 5.0
    }

    override func prepareForInterfaceBuilder() {
        sharedInit()
    }

    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }

    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }

    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    

}
