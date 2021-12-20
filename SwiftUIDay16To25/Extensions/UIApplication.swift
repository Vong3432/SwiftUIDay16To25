//
//  UIApplication.swift
//  SwiftUIDay16To25
//
//  Created by Vong Nyuksoon on 20/12/2021.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
