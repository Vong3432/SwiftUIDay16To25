//
//  Day21LearningMaterialsView.swift
//  SwiftUIDay16To25
//
//  Created by Vong Nyuksoon on 21/12/2021.
//

import SwiftUI

struct Day21LearningMaterialsView: View {
    
    @State private var showingScore = false
    @State private var showOver = false
    
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0
    @State private var count: Int = 1
    
    private let gradient = LinearGradient(
        gradient: Gradient(colors: [.blue, .black]),
        startPoint: .top,
        endPoint: .bottom)
    
    private let radialGradient = RadialGradient(stops: [
        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
    ], center: .top, startRadius: 200, endRadius: 400)
    
    var body: some View {
        ZStack {
            radialGradient
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.bold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                
            }.padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                if count == 8 {
                    showOver = true
                } else {
                    resetQuestion()
                }
            }
        } message: {
            Text("Your score is \(score)")
                .font(.title.bold())
        }
        .alert("Round end", isPresented: $showOver) {
            Button("Restart the game") {
                resetGame()
            }
        }
    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! Tha's the flag of \(countries[correctAnswer])"
            
            if score > 1 {
                score -= 1
            }
        }
        
        showingScore = true
    }
    
    private func resetQuestion() {
        count += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func resetGame() {
        count = 0
        resetQuestion()
        score = 0
    }
}

struct Day21LearningMaterialsView_Previews: PreviewProvider {
    static var previews: some View {
        Day21LearningMaterialsView()
    }
}
