//
//  WeSplitTutorialLearningView.swift
//  SwiftUIDay16To25
//
//  Created by Vong Nyuksoon on 20/12/2021.
//

import SwiftUI

struct WeSplitTutorialLearningView: View {
    
    @State private var tapCount = 0
    @State private var name = ""
    
    private let students = ["Harry", "John Doe"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) { student in
                        Text(student)
                    }
                }
                
                ForEach(0..<10) {
                    Text("Row \($0)")
                }
                
                TextField("Enter your name", text: $name)
                Text("Hello world")
                
                Section {
                    Text("Hello world")
                }
                
                Section {
                    Text("I am John Doe")
                    Text("Item2")
                }
                
                Button {
                    tapCount += 1
                } label: {
                    Text("Tap Count: \(tapCount)")
                }
            }
            .navigationTitle("WeSplitTutorial")
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct WeSplitTutorialLearningView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitTutorialLearningView()
    }
}

