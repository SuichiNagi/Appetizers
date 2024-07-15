//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/17/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

