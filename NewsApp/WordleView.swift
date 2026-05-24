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
    static let words = ["kotac", "bolid", "felga", "okvir", "volan",
                        "staza", "zavoj", "ekipa", "ispuh", "snaga"]
    
    @Environment(AuthService.self) var authService
    
    @State var attempts: [String] = []
    @State var currentInput: String = ""
    @State var solution: String = WordleView.words.randomElement()!
    @State var isOver: Bool = false
    @State var isLoadingWord: Bool = true
    
    var body: some View {
        VStack {
            if isLoadingWord {
                ProgressView("Učitavanje riječi...")
            } else {
                ScrollView {
                    AttemptsListView(attempts: attempts, solution: solution)
                    showCurrentRow(input: $currentInput)
                        .padding()
                }
                
                HStack {
                    TextField("Pogodi...", text: $currentInput)
                        .autocorrectionDisabled()
                    Button("Pošalji") {
                        attempts.append(currentInput.lowercased())
                        if currentInput.lowercased() == solution.lowercased() {
                            isOver = true
                        }
                        currentInput = ""
                    }
                    .foregroundStyle(.blue)
                    .disabled(currentInput.count != 5)
                }
                .padding()
            }
        }
        .alert("Čestitke!", isPresented: $isOver) {
            Button("Nova igra") {
                attempts = []
                solution = WordleView.words.randomElement()!
                isOver = false
            }
        } message: {
            Text("Pogodio si današnju riječ!")
        }
        .task {
            do {
                solution = try await authService.fetchWordleWord()
            } catch {
                solution = WordleView.words.randomElement()!
            }
            isLoadingWord = false
        }
    }
}

struct AttemptsListView: View {
    let attempts: [String]
    let solution: String
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(attempts.indices, id: \.self) { index in
                AttemptRowView(word: attempts[index], solution: solution)
            }
        }
    }
}

struct AttemptRowView: View {
    let word: String
    let solution: String
    
    func color(at index: Int) -> Color {
            let letter = word[index].lowercased()
            let solutionLetter = solution[index].lowercased()
            
            if letter == solutionLetter {
                return .green
            } else if solution.lowercased().contains(letter) {
                return .yellow
            }
            return Color(.systemGray2)
        }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<5, id: \.self) { index in
                Text(String(word[index]))
                    .font(.title)
                    .bold()
                    .frame(width: 65, height: 65)
                    .background(color(at: index))
                    .cornerRadius(3)
            }
        }
    }
}

struct showCurrentRow: View {
    @Binding var input: String
    
    var body: some View {
        HStack(spacing: 8){
            ForEach(0..<5, id: \.self) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(.gray.opacity(0.4))
                        .frame(width: 65, height: 65)
                    
                    if index < input.count {
                        Text(String(input[index]))
                            .font(.title)
                            .bold()
                    }
                }
                .onTapGesture {
                    if index < input.count {
                        input.remove(at: input.index(input.startIndex, offsetBy: index))
                    }
                }
            }
        }
    }
    
}

#Preview {
    WordleView()
}

