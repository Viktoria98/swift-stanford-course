import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        GameHeaderView(
            themeName: viewModel.theme.name,
            score: viewModel.score,
            newGameAction: {
                viewModel.createNewGame()
            }
        )
        .foregroundColor(viewModel.theme.color)
        Grid(viewModel.cards) { card in
            CardView(card: card)
                .onTapGesture { viewModel.choose(card: card) }
                .padding(5)
        }
        .padding()
        .foregroundColor(viewModel.theme.color)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
}

struct GameHeaderView: View {
    var themeName: String
    var score: Int
    var newGameAction: () -> Void
    
    var body: some View {
        Button(action: {
            newGameAction()
        }, label: {
            Text("New Game")
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.0)
                )
        })
        .padding()
        HStack {
            Text(themeName)
            Text(String(score))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: EmojiMemoryGame())
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
