//
//  MenuItem.swift
//  swiftui-starter-project
//
//  Created by Suman Nandi on 18/06/23.
//

import Foundation

struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var price: Int
    var deal: [String]
    var categories: String
    var thumbnail: String
}

#if DEBUG
let example = MenuItem(id: UUID(), name: "Lamp", price: 200, deal: ["Deal", "Price Reduced"], categories: "Home", thumbnail: "scooter")
#endif

