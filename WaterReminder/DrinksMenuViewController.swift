//
//  DrinksMenuViewController.swift
//  WaterReminder
//
//  Created by Владислав Лихачев on 24.06.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

class DrinksMenuViewController: UIViewController {

    let drinks : [String] = ["☕️","🍵","🥛","🧃","🥤","🍶","🍺","🍻","🍷"]
    @IBOutlet weak var menuCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        layout()
       // menuCollectionView.addGestureRecognizer(tapRecognizer)
        menuCollectionView.isUserInteractionEnabled = true
    }
    private var bottomConstraint = NSLayoutConstraint()
    private var currentState: State = .open
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(popupViewTapped(recognizer:)))
        return recognizer
    }()
    
    private func layout() {
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomConstraint = menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        bottomConstraint.isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    @objc private func popupViewTapped(recognizer: UITapGestureRecognizer) {
    }
       
}

extension DrinksMenuViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "drink", for: indexPath) as! DrinkCollectionViewCell
        cell.backgroundColor = .green
        cell.backgroundView?.alpha = 0.4
        cell.layer.cornerRadius = cell.layer.bounds.width / 2
        cell.nameLabel.text = "\(drinks[indexPath.row])"
        cell.delegate = self
        cell.isUserInteractionEnabled = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

              let state = currentState.opposite
                  let transitionAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1, animations: {
                      switch state {
                      case .open:
                          self.bottomConstraint.constant = 0
                      case .closed:
                          self.bottomConstraint.constant = 600
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
                          self.bottomConstraint.constant = 600
                          self.dismiss(animated: true)
                      }
                  }
                  transitionAnimator.startAnimation()
        }
    
}

extension DrinksMenuViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = (collectionView.frame.width - 50) / 3
        
        return CGSize(width: width, height: width)
    }
}


private enum State {
    case closed
    case open
}
 
extension State {
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}


protocol DrinksCollectionViewDelegate: class {
    func onButtonTapped(_ data : String)
}

extension DrinksMenuViewController : DrinksCollectionViewDelegate {
    func onButtonTapped(_ data : String){
      
    }
}
