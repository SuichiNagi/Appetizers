//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/13/24.
//

import SwiftUI

struct EmptyStateView: View {
    
    var imageName: String
    var description: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(edges: .all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(description)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyStateView(imageName: "empty-order", description: "This is Empty View. \n This is for test only if empty.")
}
