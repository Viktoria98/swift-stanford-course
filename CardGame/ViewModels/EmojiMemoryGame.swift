import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model = EmojiMemoryGame.createGame()
    
    static func createGame() -> MemoryGame<String> {
        let theme = GameThemes.randomTheme()
        return MemoryGame<String>(theme: theme) { pairIndex in
            return theme.emodji[Int.random(in: 0..<theme.emodji.count)]
        }
    }
    
    var theme: GameThemes.Theme {
        model.theme
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func createNewGame() {
        model = EmojiMemoryGame.createGame()
    }
    
}
