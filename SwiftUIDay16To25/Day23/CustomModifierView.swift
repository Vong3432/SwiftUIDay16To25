//
//  CustomModifierView.swift
//  SwiftUIDay16To25
//
//  Created by Vong Nyuksoon on 21/12/2021.
//

import SwiftUI

// view modifiers
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct ForChallenge: ViewModifier {
    let title: String
    func body(content: Content) -> some View {
        Text(title)
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

// extension
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
    
    func forChallengeStyle(title: String) -> some View {
        modifier(ForChallenge(title: title))
    }
}

struct CustomModifierView: View {
    var body: some View {
        VStack {
            
            // with modifier
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .modifier(Title())
            
            // with modifier + extension
            Text("Modifer with extension")
                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Copyright")
            
            Color.blue
                .frame(width: 300, height: 200)
                .forChallengeStyle(title: "Hello world")
        }
    }
}

struct CustomModifierView_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifierView()
    }
}
