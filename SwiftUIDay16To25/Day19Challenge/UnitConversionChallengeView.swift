//
//  UnitConversionChallengeView.swift
//  SwiftUIDay16To25
//
//  Created by Vong Nyuksoon on 21/12/2021.
//

import SwiftUI

struct UnitConversionChallengeView: View {
    
    @State private var selectedInputUnit: UnitLength = .meters
    @State private var selectedOutputUnit: UnitLength = .kilometers
    @State private var value: Double = 0
    
    private var outputValue: String {
        let curr = Measurement(value: value, unit: selectedInputUnit)
        let meters = curr.converted(to: .meters)
        
        return meters.converted(to: selectedOutputUnit).value.formatted(.number)
    }
    
    private let units: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    //    private let units = ["meters", "kilometers", "feet", "yard", "miles"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", value: $value, format: .number)
                        .keyboardType(.numberPad)
                } header: {
                    Text("Input value")
                }
                
                Section {
                    Picker("Select input unit", selection: $selectedInputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0.symbol)")
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Input unit")
                }
                
                Section {
                    Picker("Select output", selection: $selectedOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0.symbol)")
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Output unit")
                }
                
                Section {
                    Text(outputValue)
                } header: {
                    Text("Output value")
                }
            }
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        UIApplication.shared.endEditing()
                    }
                }
            }
            .navigationTitle("Unit Convert")
        }
    }
}

struct UnitConversionChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConversionChallengeView()
    }
}
