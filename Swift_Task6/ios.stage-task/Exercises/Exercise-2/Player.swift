//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
  var hand: [Card]?

  func checkIfCanTossWhenAttacking(card: Card) -> Bool {
    var result = false
    self.hand?.forEach{
      if $0.value == card.value {
        result = true
      }
    }
    return result
  }
  
  func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
    var result = false

   let allCardsOnTable = Array(table.keys) + Array(table.values)
    
    guard let hand = self.hand else { return result }
    
    allCardsOnTable.forEach{cardOnTable in
      hand.forEach{cardOnHand in
        if cardOnHand.value == cardOnTable.value {
          result = true

        }
      }
    }
return result
  }
}
