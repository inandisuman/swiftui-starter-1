//
//  swiftui_starter_projectApp.swift
//  swiftui-starter-project
//
//  Created by Suman Nandi on 14/06/23.
//

import SwiftUI

@main
struct swiftui_starter_projectApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
