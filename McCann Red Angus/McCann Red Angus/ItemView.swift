import SwiftUI

struct ItemView: View {
  var item: Item
  
  var body: some View {
    HStack {
      Text(item.image).padding(20)
      VStack {
        Text(item.name).bold().multilineTextAlignment(.leading)
        Text(item.number).padding(10)
      }
    }
  }
}
