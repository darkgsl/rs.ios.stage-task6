//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
      var playerWitnMinTrumpCard : Player?
      var minTrumpCard: Card?
      // доступа к экземляру deсk нет, делаем чз ....
      //найдем любой козырь
      players.forEach { (player) in
        player.hand?.forEach{ (card) in
          if card.isTrump {
          minTrumpCard = card
          }
        }
      }
      if (minTrumpCard != nil) {
      
        guard var minTrumpCard = minTrumpCard else { return nil }
      
      players.forEach { (player) in
        player.hand?.forEach {
          if $0.isTrump {
            //хотя minTrumpCard
            if $0 < minTrumpCard {  //подписали Card под comparable
              minTrumpCard = $0
              playerWitnMinTrumpCard = player
          }
        }
      }
      }
      
      
      
       
    }
      return playerWitnMinTrumpCard
}
}

