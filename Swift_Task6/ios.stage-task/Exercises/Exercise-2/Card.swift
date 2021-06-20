import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, Codable, CaseIterable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {
      hasher.combine(suit.hashValue^value.hashValue)
      
      //hasher = suit.hashValue ^ value.hashValue
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
      //
      
      lhs.value == rhs.value && lhs.suit == rhs.suit && lhs.isTrump == rhs.isTrump
     //return false
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
      //начнем с козыря
      //
      if self.isTrump && card.isTrump {
        //проверим кто больше и адью
        if self > card {
          return true
        }
      } else if self.isTrump {
        return true
      } else {
        return self > card
      }
      
      
//      if self < card {
//        return true
//      }

        return false
    }

    func checkValue(card: Card) -> Bool {
        return false
    }
}

extension Card: Comparable{
  static func < (lhs: Card, rhs: Card) -> Bool {
    if lhs.isTrump && rhs.isTrump {
      //оба козыря
      //сравниваем
      //и выход
      if lhs.suit == rhs.suit {
        if lhs.value.rawValue < rhs.value.rawValue {
          return true
        }
      } else {
        //разные масти, сравнивать нельзя
        return false
      }
      
      
    } else if lhs.isTrump {
      //левый козырь правый нет
      return false
    } else if rhs.isTrump {
      //правый козырь левый нет
    } else {
      //оба не козыря
      // сравниваем масть и значение
      if lhs.suit == rhs.suit {
        if lhs.value.rawValue < rhs.value.rawValue {
          return true
        }
      } else {
        //разные масти, сравнивать нельзя
        return false
      }
    }

    
    
    return false
  }
  
  
}
