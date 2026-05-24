//
//  ContentView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 14.04.2026..
//

import SwiftUI

enum Tab {
    case novosti, igrice
}

struct ContentView: View {
    @State private var selectedTab: Tab = .novosti
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ArticlesListView()
                .tabItem { Label("Novosti", systemImage: "newspaper") }
                .tag(Tab.novosti)
            
            WordleView()
                .tabItem { Label("Igrice", systemImage: "gamecontroller") }
                .tag(Tab.igrice)
        }
    }
}

#Preview {
    ContentView()
}
