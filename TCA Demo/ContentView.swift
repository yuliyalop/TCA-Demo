//
//  ContentView.swift
//  TCA Demo
//
//  Created by Yuliya Lapatsina on 28/01/2024.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var state: AppState

  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: CounterView(state: self.state)) {
          Text("Counter demo")
        }
        NavigationLink(destination: EmptyView()) {
          Text("Favorite primes")
        }
      }
      .navigationBarTitle("State management")
    }
  }
}

#Preview {
    ContentView(state: AppState())
}
