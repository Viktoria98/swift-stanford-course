import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Button(action: {
            viewModel.newGame()
        }, label: {
            Text("New Game")
        })
        Grid(viewModel.cards) { card in
            CardView(card: card)
                .onTapGesture { viewModel.choose(card: card) }
                .padding(10)
        }
        .padding()
        .foregroundColor(.yellow)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.yellow)
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
    
    // MARK: - Drawing consstants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
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
