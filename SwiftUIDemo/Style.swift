//
//  Style.swift
//  SwiftUIDemo
//
//  Created by Willy Hsu on 2024/12/25.
//

import Foundation
import SwiftUI

extension View {
    func displayFontSize(for text: String) -> CGFloat {
        return text.count > 5 ? 40 : 50
    }
    
    
}
