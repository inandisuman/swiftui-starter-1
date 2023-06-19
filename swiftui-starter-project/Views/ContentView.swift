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
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(menu.name)
                    .font(.headline)
                    .fontWeight(.bold)) {
                        ForEach(menu.items) { item in
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
