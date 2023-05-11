import Foundation
import SwiftUI
final class ContentViewModel: ObservableObject {
    @Published var labelText = "Labeltext"
    @Published var labelColor: Color = .red
    @Published var searchText = "Search"
    @Published var inputText = ""
    @Published var navTitle = "Boats"
    @Published var items: [Item] = [
        Item(image: "Awesome Image", number: "512-4132", name: "Bob"),
        Item(image: "Awesome Image", number: "552-1234", name: "Bill"),
        Item(image: "Awesome Image", number: "672-1234", name: "Ray"),
        Item(image: "Awesome Image", number: "892-1234", name: "Ted"),
        Item(image: "Awesome Image", number: "432-1234", name: "Mike"),
    ]
    
    func toggleLabelText() {
        labelText = labelText == "Labeltext" ? "Switch" : "Labeltext"
        labelColor = labelColor == .red ? .green : .red
        items.shuffle()
        
    }
    
    func deleteRequestedAtOffset(_ index: IndexSet){
        items.remove(atOffsets: index)
    }
}
