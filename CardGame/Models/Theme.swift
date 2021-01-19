import SwiftUI

struct GameThemes {
    static var themes = [
        Theme(
            name: "Sport",
            emodji: ["⚽️", "🏈", "🥎", "🏐", "🥊", "🏓", "🛼", "⛸", "🏄🏻‍♀️", "🎯", "🛹", "🏒", "🤿", "🥋", "🏸"],
            numberOfPairs: 14,
            color: .yellow
        ),
        Theme(
            name: "Faces",
            emodji: ["😤", "🤪", "🧐", "😎", "🥸", "🤯", "😵", "🤐", "🥴", "🤠", "👿", "👻", "💩", "👽", "😻"],
            numberOfPairs: Int.random(in: 3...12),
            color: .purple
        ),
        Theme(
            name: "Food",
            emodji: ["🍆", "🍕", "🍟", "🍔", "🥨", "🍜", "🍥", "🎂", "🍭", "🍩", "🥜", "🍤", "🦪", "🍣", "🥗"],
            numberOfPairs: Int.random(in: 3...15),
            color: .red
        ),
        Theme(
            name: "Winter",
            emodji: ["🥶", "🧤", "🧦", "🧣", "🎄", "❄️", "☃️"],
            numberOfPairs: 6,
            color: .blue
        ),
        Theme(
            name: "Animals",
            emodji: ["🐣", "🐠", "🐬", "🦕", "🐙", "🦑", "🐏", "🦤", "🦚", "🐁"],
            numberOfPairs: 6,
            color: .pink
        ),
        Theme(
            name: "Plants",
            emodji: ["🌵", "🌴", "🌸", "🍁", "🌼", "🌲", "🍂", "🪴"],
            numberOfPairs: 9,
            color: .green
        )
    ]
    
    static func randomTheme() -> GameThemes.Theme {
        GameThemes.themes[Int.random(in: 0..<GameThemes.themes.count)]
    }
    
    struct Theme {
        var name: String
        var emodji: [String]
        var numberOfPairs: Int
        var color: Color
    }
}






