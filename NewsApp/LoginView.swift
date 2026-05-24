//
//  LoginView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 24.05.2026..
//

import SwiftUI

struct LoginView: View {
    @Environment(AuthService.self) var authService
    
    @State private var username = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Prijava")
                .font(.largeTitle)
                .bold()
            
            TextField("Korisničko ime", text: $username)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            SecureField("Lozinka", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button {
                Task {
                    isLoading = true
                    do {
                        try await authService.login(username: username, password: password)
                    } catch {
                        errorMessage = "Greška pri prijavi. Pokušaj ponovno."
                    }
                    isLoading = false
                }
            } label: {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Prijavi se")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(username.isEmpty || password.isEmpty || isLoading)
        }
        .padding()
        .alert("Greška", isPresented: .constant(errorMessage != nil)) {
            Button("OK") { errorMessage = nil }
        } message: {
            Text(errorMessage ?? "")
        }
    }
}
