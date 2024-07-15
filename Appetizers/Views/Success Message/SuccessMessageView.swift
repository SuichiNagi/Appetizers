//
//  SuccessMessageView.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/14/24.
//

import SwiftUI

struct SuccessMessageView: View {
    
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.brandPrimary)
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
                .transition(.opacity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.4))
    }
}

#Preview {
    SuccessMessageView(title: "Successfully Added")
}
