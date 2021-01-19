import Foundation

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
