//
//  ItemRowView.swift
//  swiftui-starter-project
//
//  Created by Suman Nandi on 18/06/23.
//

import SwiftUI

struct ItemRowView: View {
    
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: item.thumbnail)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.gray, lineWidth: 2))
            
            Text(item.name)
                .font(.custom("san-serif", size: 12))
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Button {
                    // Action to push item to cart
                    order.add(item)
                } label: {
                    HStack {
                    Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 10, height: 10)
                    Text("Add")
                            .font(.custom("san-serif", size: 12))
                    }
                }
                .padding(5)
                .background(Color(UIColor.orange))
                .foregroundColor(.white)
                .cornerRadius(5)
                .buttonStyle(BorderlessButtonStyle())
                
                Text("$\(item.price)")
                    .font(.custom("san-serif", size: 14))
                    .fontWeight(.heavy)
            }
            
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: example)
    }
}
