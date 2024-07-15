//
//  NavigationTitleView.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/6/24.
//

import SwiftUI

struct NavigationTitleView: View {
    
    var imageName: String
    var title: String
    var color: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text(title)
                .fontWeight(.bold)
                .font(.custom("ArialMT", size: 30))
        }
        .foregroundStyle(Color(hexColor(color)))
        .padding(.vertical)
    }
}

#Preview {
    NavigationTitleView(imageName: "fork.knife.circle", title: "Sample", color: "40A578")
}
