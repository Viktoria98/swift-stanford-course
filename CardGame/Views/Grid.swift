import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], _ viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.itemView(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func itemView(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            let index = items.firstIndex { $0.id == item.id }
            viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index!))
        }
    }

}
