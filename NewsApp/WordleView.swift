//
//  WordleView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 15.04.2026..
//

import SwiftUI

import SwiftUI

extension String {
    subscript(_ i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

struct WordleView: View {
    let mockAttempts = ["kotač", "ormar", "mačka"]
    @State private var currentInput: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                AttemptsListView(attempts: mockAttempts)
                    .padding()
            }
            
            HStack {
                TextField("Pogodi...", text: $currentInput)
                    .autocorrectionDisabled()
                Button("Pošalji") { }
                    .foregroundStyle(.blue)
            }
            .padding()
        }
    }
}

struct AttemptsListView: View {
    let attempts: [String]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(attempts.indices, id: \.self) { index in
                AttemptRowView(word: attempts[index])
            }
        }
    }
}

struct AttemptRowView: View {
    let word: String
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<5, id: \.self) { index in
                Text(String(word[index]))
                    .font(.title)
                    .bold()
                    .frame(width: 65, height: 65)
                    .background(Color(.systemGray4))
                    .cornerRadius(3)
            }
        }
    }
}

#Preview {
    WordleView()
}

