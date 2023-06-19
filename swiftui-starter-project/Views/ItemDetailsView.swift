//
//  ItemDetailsView.swift
//  swiftui-starter-project
//
//  Created by Deboleena on 18/06/23.
//

import SwiftUI

struct ItemDetailsView: View {
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            ForEach(item.deal, id: \.self) { deal in
                Text("\(deal)")
            }
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView(item: example)
    }
}
