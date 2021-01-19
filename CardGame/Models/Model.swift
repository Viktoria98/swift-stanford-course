import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards = Array<Card>()
    
    var indexOfTheOnlyOneFaceUpCard: Int? {
        get { cards.indices.filter{ cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        guard let choosenIndex = cards.firstIndex(where: { $0.id == card.id }) else { return }
        if !cards[choosenIndex].isFaceUp, !cards[choosenIndex].isMatched  {
            if let potentialMatchIndex = indexOfTheOnlyOneFaceUpCard {
                if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[choosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyOneFaceUpCard = choosenIndex
            }
        }
    }
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
    
}
