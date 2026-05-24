//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Matej Samaržija on 14.04.2026..
//

import SwiftUI

@main
struct NewsAppApp: App {
    @State private var authService = AuthService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authService)
        }
    }
}
