import SwiftUI
struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    var label: Text { Text(viewModel.labelText) }
    var secondView: Text { Text("Second View") }
    
    var body: some View {
        NavigationView{
            VStack{
                Image("jeanneau53")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                TextField(viewModel.searchText, text: $viewModel.inputText).padding().border(.tertiary)
                List {
                    ForEach(viewModel.items) { item in
                        ItemView(item: item)
                            .foregroundColor(.white)
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 15)
                                .background(.clear)
                                .foregroundColor(.blue)
                               .padding(
                                   EdgeInsets(
                                       top: 4,
                                       leading: 20,
                                       bottom: 4,
                                       trailing: 20
                                   )
                               )
                            )
                    }.onDelete{ index in
                        viewModel.deleteRequestedAtOffset(index)
                        }.listRowSeparator(.hidden)
                        
                }
            HStack {
                VStack {
                    NavigationLink(destination: secondView){
                        Text("Go Somewhere")
                    }.padding()
                    Button("Change color") {
                        viewModel.toggleLabelText()
                    }.foregroundColor(.cyan).padding()
                }.background(Color.white)
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .navigationTitle(viewModel.navTitle)
                        .navigationBarTitleDisplayMode(.inline)
                    label.bold().foregroundColor(viewModel.labelColor)
                }
            }.padding().background(Color.indigo)
        }}
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



