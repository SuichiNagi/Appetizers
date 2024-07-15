//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/10/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
//    @EnvironmentObject var order: OrderModel
    @Environment(OrderModel.self) var order
    
    let appetizer: AppetizerModel
    @Binding var isShowingDetail: Bool
    
    var nutritionInfo: [(title: String, value: String)]
    {
        [
            ("Calories", "\(appetizer.calories)"),
            ("Carbs", "\(appetizer.carbs) g"),
            ("Protein", "\(appetizer.protein) g")
        ]
    }
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:40) {
                    ForEach(nutritionInfo, id: \.title) { info in
                        NutritionInfoView(title: info.title, value: info.value)
                    }
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                Text("$\(appetizer.price, specifier: "%0.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

struct NutritionInfoView: View {
    
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

