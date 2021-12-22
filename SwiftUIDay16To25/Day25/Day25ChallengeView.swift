//
//  Day25ChallengeView.swift
//  SwiftUIDay16To25
//
//  Created by Vong Nyuksoon on 22/12/2021.
//

// challenge
/**
 You have a basic understanding of arrays, state, views, images, text, and more, so let’s put them together: your challenge is to make a brain training game that challenges players to win or lose at rock, paper, scissors.
 
 So, very roughly:
 
 - Each turn of the game the app will randomly pick either rock, paper, or scissors.
 - Each turn the app will alternate between prompting the player to win or lose.
 - The player must then tap the correct move to win or lose the game.
 - If they are correct they score a point; otherwise they lose a point.
 - The game ends after 10 questions, at which point their score is shown.
 
 So, if the app chose “Rock” and “Win” the player would need to choose “Paper”, but if the app chose “Rock” and “Lose” the player would need to choose “Scissors”.
 
 To solve this challenge you’ll need to draw on skills you learned in tutorials 1 and 2:
 
 -  Start with an App template, then create a property to store the three possible moves: rock, paper, and scissors.
 - You’ll need to create two @State properties to store the app’s current choice and whether the player should win or lose.
 - You can use Int.random(in:) to select a random move. You can use it for whether the player should win too if you want, but there’s an even easier choice: Bool.random() is randomly true or false. After the initial value, use toggle() between rounds so it’s always changing.
 - Create a VStack showing the player’s score, the app’s move, and whether the player should win or lose. You can use if shouldWin to return one of two different text views.
 - The important part is making three buttons that respond to the player’s move: Rock, Paper, or Scissors.
 - Use the font() modifier to adjust the size of your text. If you’re using emoji for the three moves, they also scale. Tip: You can ask for very large system fonts using .font(.system(size: 200)) – they’ll be a fixed size, but at least you can make sure they are nice and big!
 
 */

import SwiftUI

extension Button {
    func customBtnStyle() -> some View {
        modifier(ButtonViewModifier())
    }
}

struct ButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.headline.weight(.black))
            .foregroundStyle(.secondary)
            .frame(width: 150, height: 70)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
            .clipShape(Capsule())
    }
}

enum Decision: String {
    case rock, paper, scissors
}

struct Day25ChallengeView: View {
    
    private let maxRound = 10
    
    @State private var score = 0
    @State private var decisions: [Decision] = [Decision.rock, Decision.paper, Decision.scissors]
    @State private var playerShouldWin = Bool.random()
    @State private var currentChoice = Decision.rock
    @State private var round = 1
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("You should \(playerShouldWin ? "win" : "lose") this round.")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .font(.title3.bold())
                .background(Color(red: 0.4, green: 0.3, blue: 1))
            
            Spacer()
            
            Text("Score: \(score)")
            Text(currentChoice.rawValue)
                .font(.system(size: 70).bold())
            
            VStack(spacing: 18) {
                Button("Rock") {
                    // tap rock
                    onBtnTapped(decision: .rock)
                }.customBtnStyle()
                
                Button("Paper") {
                    // tap paper
                    onBtnTapped(decision: .paper)
                }.customBtnStyle()
                
                Button("Scissors") {
                    // tap scissors
                    onBtnTapped(decision: .scissors)
                }.customBtnStyle()
            }
            
            Spacer()
        }.alert("Round over!", isPresented: $showAlert) {
            Button("Restart") {
                reset()
            }
        }
    }
    
    private func regenerateQuestion() {
        round += 1
        currentChoice = decisions[Int.random(in: 0...2)]
        playerShouldWin = Bool.random()
    }
    
    private func onBtnTapped(decision: Decision) {
        let isCorrect = isPlayerCorrect(playerChoice: decision)
        
        if isCorrect {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
        
        if round == maxRound {
            showAlert = true
        } else {
            regenerateQuestion()
        }
    }
    
    private func isPlayerCorrect(playerChoice decision: Decision) -> Bool {
        
        // the corrent answer for current choice
        var theCorrectDecision: Decision
        
        switch currentChoice {
            case .rock:
                theCorrectDecision = playerShouldWin ? Decision.paper : Decision.scissors
            case .paper:
                theCorrectDecision = playerShouldWin ? Decision.scissors : Decision.rock
            case .scissors:
                theCorrectDecision = playerShouldWin ? Decision.rock : Decision.paper
        }

        // correct ans should equal to player decision
        return theCorrectDecision == decision
    }
    
    private func reset() {
        round = 0
        score = 0
        
        regenerateQuestion()
    }
}

struct Day25ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        Day25ChallengeView()
    }
}
