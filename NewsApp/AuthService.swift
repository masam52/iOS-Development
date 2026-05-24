//
//  AuthService.swift
//  NewsApp
//
//  Created by Matej Samaržija on 24.05.2026..
//

import SwiftUI

@Observable
class AuthService {
    var token: String? = nil
    var username: String? = nil
    
    var isLoggedIn: Bool {
        token != nil
    }
    
    func login(username: String, password: String) async throws {
        let url = URL(string: "https://ios-vjestina.flabbergast.com/login")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode([
            "username": username,
            "password": password
        ])
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(LoginResponse.self, from: data)
        
        self.token = response.token
        self.username = response.username
    }
    
    func logout() {
        token = nil
        username = nil
    }
}

struct LoginResponse: Codable {
    let token: String
    let username: String
}
