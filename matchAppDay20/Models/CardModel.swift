//
//  CardModel.swift
//  matchAppDay20
//
//  Created by Decagon on 07/09/2021.
//

import Foundation

class CardModel {
  
  var generatedCards = [Card]()
  
  func getCards() -> [Card] {
    var randomNumberArray = [Int]()

     while generatedCards.count < 16 {
      let randomNumber =  Int.random(in: 1...13)
      
      print(randomNumber)

      let cardOne = Card()
      let cardTwo = Card()

      cardOne.imageName = "card\(randomNumber)"
      cardTwo.imageName = "card\(randomNumber)"

      if !randomNumberArray.contains(randomNumber) {
        generatedCards += [cardOne, cardTwo]
        print(generatedCards)
      }
      randomNumberArray.append(randomNumber)

      generatedCards.shuffle()
    }
    print(randomNumberArray)
    return generatedCards
  }
}
