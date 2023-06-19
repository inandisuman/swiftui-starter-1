//
//  Helper.swift
//  swiftui-starter-project
//
//  Created by Deboleena on 18/06/23.
//

import Foundation

extension Bundle {
    func decode(from file: String) -> MenuSection {
        if let url = Bundle.main.url(forResource: file, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MenuSection.self, from: data)
                return jsonData
            } catch {
                fatalError("Error:\(error)")
            }
        }
        fatalError("Decoding issue")
    }
}
