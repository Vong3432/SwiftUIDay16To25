//
//  Project2LearningMaterialView.swift
//  SwiftUIDay16To25
//
//  Created by Vong Nyuksoon on 21/12/2021.
//

import SwiftUI

struct Planet: Identifiable {
    let id = UUID().uuidString
    let name: String
    let title: String
    let desc: String
}

struct Day20LearningMaterialView: View {
    
    @State private var showAlert = false
    
    let linearGradient = LinearGradient(
        gradient: Gradient(
            colors: [
                .white,
                .black
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
    
    let linearGradientWithStop = LinearGradient(
        gradient: Gradient(stops: [
            Gradient.Stop(color: .gray, location: 0.1),
            Gradient.Stop(color: .black, location: 1.2)
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    let radialGradient = RadialGradient(
        gradient: Gradient(colors: [
            .teal,
            .blue,
            .black
        ]),
        center: .center,
        startRadius: 30,
        endRadius: 150
    )
    
    let sunRadialGradient = RadialGradient(
        gradient: Gradient(colors: [
            .yellow,
            .orange,
            .black
        ]),
        center: .center,
        startRadius: 30,
        endRadius: 150
    )
    
    let angularGradient = AngularGradient(
        gradient: Gradient(colors: [.red, .yellow, .red]),
        center: .center
    )
    
    let planets: [Planet] = [
        Planet(
            name: "Meow meow",
            title: "Welcome to the app",
            desc: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."
        ),
        Planet(
            name: "Meow2 planet",
            title: "Welcome to the meow2 planet.",
            desc: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."
        )
    ]
    
    var body: some View {
        ZStack {
            //            linearGradientWithStop
            //                .ignoresSafeArea()
            radialGradient
                .ignoresSafeArea()
            //            angularGradient
            //                .ignoresSafeArea()
            
            planetsView
        }
    }
}

struct Day20LearningMaterialView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Day20LearningMaterialView()
            
            //            Project2LearningMaterialView()
            //                .preferredColorScheme(.dark)
            //                .previewDisplayName("Dark mode")
        }
    }
}

struct Day20ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

extension Day20LearningMaterialView {
    private var stackView: some View {
        VStack {
            HStack {
                Text("H1")
                Text("H1")
                Text("H1")
            }
            HStack {
                Text("H2")
                Text("H2")
                Text("H2")
            }
            HStack {
                Text("H3")
                Text("H3")
                Text("H3")
            }
        }
    }
    
    private var colorAndFrameView: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Hello world")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }.ignoresSafeArea()
    }
    
    
    private var planetsView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(planets) { planet in
                    VStack(alignment: .leading, spacing: 20) {
                        Text(planet.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text(planet.title)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "heart")
                            }
                            
                            Text(planet.desc)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack {
                                Button {
                                    print("Edit button was tapped")
                                    showAlert = true
                                }label: {
                                    Label("Book this", systemImage: "airplane")
                                }
                                .frame(maxWidth: .infinity)
                                .modifier(Day20ButtonModifier())
                                .alert("Important message", isPresented: $showAlert) {
                                    Button("OK", role: .destructive) { }
                                    Button("Cancel", role: .cancel) { }
                                } message: {
                                    Text("Please read this")
                                }
                                
                                //                        Button("Delete this planet", role: .destructive) {
                                //                            print("Delete")
                                //                        }
                                //                        .frame(maxWidth: .infinity)
                                //                        .padding()
                                //                        .background(.red)
                                //                        .cornerRadius(18)
                                
                            }.padding(.top)
                                .frame(maxWidth: .infinity)
                        }
                        
                    }.foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: UIScreen.main.bounds.width)
                }
            }
            
        }
    }
}
