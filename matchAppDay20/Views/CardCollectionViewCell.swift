//
//  CardCollectionViewCell.swift
//  matchAppDay20
//
//  Created by Decagon on 07/09/2021.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var frontImageView: UIImageView!
  @IBOutlet weak var backImageView: UIImageView!
  var card: Card?
  
  func configureCell(card: Card) {
    
    self.card = card
    frontImageView.image = UIImage(named: card.imageName )
    if card.isFlipped == true {
      flipUp(duration: 0)
      
    } else {
      flipDown(duration: 0, delay: 0)
    }
  }
  
  func flipUp(duration: TimeInterval = 0.3) {
    
    UIView.transition(from: backImageView, to: frontImageView, duration: duration, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    
    card?.isFlipped = true
  }
  
  func flipDown(duration: TimeInterval = 0.3, delay: TimeInterval = 0.5) {
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay ) {
      UIView.transition(from: self.frontImageView, to: self.backImageView, duration: duration, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
//    UIView.transition(from: frontImageView, to: backImageView, duration: duration, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    
    card?.isFlipped = false
  }
  
  func removeImage() {
  
    // Make the image view invisible
    backImageView.alpha = 0
    
    UIView.animate(withDuration: 0.3, delay: 0.5, animations: {
      self.frontImageView.alpha = 0
    }, completion: nil)

  }
  
}
