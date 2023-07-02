//
//  ContentView.swift
//  swiftui-starter-project
//
//  Created by Suman Nandi on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode(from: "Menus")
    
    @EnvironmentObject var order: Order
    @State private var searchedText = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(menu.name)
                    .font(.headline)
                    .fontWeight(.bold)) {
                        ForEach(filteredItems) { item in
                            NavigationLink {
                                ItemDetailsView(item: item)
                            } label: {
                                ItemRowView(item: item)
                            }
                        }
                    }
            }
            .navigationTitle("Menu")
            .listStyle(.insetGrouped)
            .searchable(text: $searchedText, prompt: "Search item")
        }
    }
    
    var filteredItems: [MenuItem] {
        if searchedText.isEmpty {
            return menu.items
        } else {
            return menu.items.filter { $0.name.localizedCaseInsensitiveContains(searchedText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
