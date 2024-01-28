//
//  AppState.swift
//  TCA Demo
//
//  Created by Yuliya Lapatsina on 28/01/2024.
//

import Combine
import Foundation

final class AppState: ObservableObject, Codable {
    @Published var count = 0 {
        didSet {
            do {
                let jsonData = try JSONEncoder().encode(self)
                UserDefaults.standard.setValue(jsonData, forKey: "appState")
            }
            catch {
                print("Error with count saving: \(error)")
            }
        }
    }
    
    enum CodingKeys: CodingKey {
        case count
    }
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
    }
}
