//
//  TCA_DemoApp.swift
//  TCA Demo
//
//  Created by Yuliya Lapatsina on 28/01/2024.
//

import SwiftUI

@main
struct TCA_DemoApp: App {
    var body: some Scene {
        WindowGroup {
            if let jsonData = UserDefaults.standard.value(forKey: "appState"),
               let appState = try? JSONDecoder().decode(AppState.self, from: jsonData as! Data) {
                ContentView(state: appState)
            } else  {
                ContentView(state: AppState())
            }
        }
    }
}
