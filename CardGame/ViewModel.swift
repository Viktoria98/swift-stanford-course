import Foundation

class EmojiMemoryGame {
    
    private var model = EmojiMemoryGame.createGame()
    
    static func createGame() -> MemoryGame<String> {
        let emodji = ["🧚‍♂️", "🧶", "🧤", "🧦", "🧣", "🎄", "🌹", "🌱", "🐚", "❄️", "☃️", "🍕"]
        return MemoryGame<String>(numberOfPairs: Int.random(in: 2...5)) { pairIndex in
            return emodji[Int.random(in: 0..<emodji.count)]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards.shuffled()
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
