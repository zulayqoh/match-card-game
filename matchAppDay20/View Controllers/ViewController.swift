//
//  ViewController.swift
//  matchAppDay20
//
//  Created by Decagon on 07/09/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var cardCollectionView: UICollectionView!
  
  let model = CardModel()
  var cardsArray = [Card]()
  
  var firstFlippedCardIndex: IndexPath?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    cardCollectionView.delegate = self
    cardCollectionView.dataSource = self
    
    cardsArray = model.getCards()
  }
  
  // MARK: - Collection view delegate method
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cardsArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
    
    // TODO: Configuration
    cell.configureCell(card: cardsArray[indexPath.row ])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
    
    if cell?.card?.isFlipped == false {
      
      cell?.flipUp()
      
      if firstFlippedCardIndex == nil {
        
        firstFlippedCardIndex = indexPath
        
      } else {
        checkForMatch(secondFlippedCardIndex: indexPath )
      }
    }
  }
  
  
  // MARK: - Game Logic Method
  func checkForMatch(secondFlippedCardIndex: IndexPath) {
    
    let cardOne = cardsArray[firstFlippedCardIndex!.row]
    let cardTwo = cardsArray[secondFlippedCardIndex.row]
    
//    let cardOneCell = collectionView(cardCollectionView, cellForItemAt: firstFlippedCardIndex!)
    let cardOneCell = cardCollectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
    let cardTwoCell = cardCollectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
    
    
    if cardOne.imageName == cardTwo.imageName {
      
      cardOne.isMatched = true
      cardTwo.isMatched = true
      
      cardOneCell?.removeImage()
      cardTwoCell?.removeImage()
      
    } else {
      cardOneCell?.flipDown()
      cardTwoCell?.flipDown()
      
    }
    
    firstFlippedCardIndex = nil
  }
  
}


