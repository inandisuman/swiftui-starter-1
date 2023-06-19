//
//  Order.swift
//  swiftui-starter-project
//
//  Created by Suman Nandi on 18/06/23.
//

import Foundation

class Order: ObservableObject {
    
    @Published var items = [MenuItem]()
    
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    func add(_ item: MenuItem) {
        items.append(item)
    }
    
    func remove(_ item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
