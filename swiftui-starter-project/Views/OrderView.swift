//
//  OrderView.swift
//  swiftui-starter-project
//
//  Created by Suman Nandi on 18/06/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                ForEach(order.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Order Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .disabled(order.items.isEmpty)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink {
                        // Navigate to checkout view
                        CheckoutView()
                    } label: {
                        Text("Confirm")
                    }
                }
            }
            .disabled(order.items.isEmpty)
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
            order.items.remove(atOffsets: offsets)
        }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
