import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

  var cards = [Card] ()
    
  
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
      //неправильно, но пока так
      cards += self.createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
      var cardsTemp = [Card]()
      for value in values {
      
        //print(suit)
        for suit in Suit.allCases {
        //  print(value)
          cardsTemp.append(Card(suit: suit, value: value))
          
        }
      }
      
     // print(cardsTemp)
      return  cardsTemp
    }

  public mutating func shuffle() {
    // можно поменять на обычный for in
    

    
    for (index, _ ) in cards.enumerated() {
      var newIndex = Int.random(in: 0...self.cards.count - 1)
      //print(newIndex)
      cards.insert(cards.remove(at: index), at: newIndex)
     // cards.replaceSubrange(RangeExpression, with: <#T##Collection#>)
    }
    
  }

  public mutating func defineTrump() {
    self.trump = cards.last?.suit
      for index in 0..<cards.count {
        if cards[index].suit == self.trump {
          cards[index].isTrump = true
        }
      }

    }

  public mutating func initialCardsDealForPlayers(players: [Player]) {
    players.forEach { $0.hand = [] }
    
    
      for _ in 1...6 {
        players.forEach { $0.hand?.append(cards.removeLast()) }
 
      }
      
      

    }

    public func setTrumpCards(for suit:Suit) {

    }
}

