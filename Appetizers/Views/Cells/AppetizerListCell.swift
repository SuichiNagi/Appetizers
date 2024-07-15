//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/7/24.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: AppetizerModel
    
    var body: some View {
        HStack  {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            //If you don't need caching use this AsyncImage method
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                ImageConfig(image: image)
//            } placeholder: {
//                ImageConfig(image: Image("food-placeholder"))
//            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading, 5)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}

struct ImageConfig: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .presentationCornerRadius(8)
    }
}
