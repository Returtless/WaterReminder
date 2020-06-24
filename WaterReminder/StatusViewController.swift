//
//  DrinksMenuViewController.swift
//  WaterReminder
//
//  Created by Владислав Лихачев on 24.06.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
    
    let drinks : [String] = ["☕️","🍵","🥛","🧃","🥤","🍶","🍺","🍻","🍷"]
    var bottomConstraint = NSLayoutConstraint()
    var currentState: State = .closed
    var currentVolume : CGFloat = 0 {
      didSet {
        progressIndicator.progress = CGFloat(currentVolume/2000)
      }
    }
    let maxVolume = 2000
    
    @IBOutlet weak var progressIndicator : CircleIndicator!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    @IBAction func addButtonTouched(_ sender: SettingsButton) {
        animateDrinksMenu()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.progress = 0
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        layout()
        menuCollectionView.isUserInteractionEnabled = true
    }

    private func layout() {
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomConstraint = menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 440)
        bottomConstraint.isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 440).isActive = true
    }
    
    func animateDrinksMenu(){
        let state = currentState.opposite
        let transitionAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1, animations: {
            switch state {
            case .open:
                self.bottomConstraint.constant = 0
            case .closed:
                self.bottomConstraint.constant = 440
            }
            self.view.layoutIfNeeded()
        })
        transitionAnimator.addCompletion { position in
            switch position {
            case .start:
                self.currentState = state.opposite
            case .end:
                self.currentState = state
            case .current:
                ()
            }
            switch self.currentState {
            case .open:
                self.bottomConstraint.constant = 0
            case .closed:
                self.bottomConstraint.constant = 440
                self.dismiss(animated: true)
            }
        }
        transitionAnimator.startAnimation()
    }
    
}

