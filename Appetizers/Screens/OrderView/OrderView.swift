//
//  OrderView.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/5/24.
//

import SwiftUI

struct OrderView: View {
    
//    @EnvironmentObject var orderItems: OrderModel
    @Environment(OrderModel.self) var orderItems
 
    var body: some View {
        NavigationView {
            VStack {
                if orderItems.items.isEmpty {
                    EmptyStateView(imageName: "empty-order", description: "You have no items in your order. \nPlease add order in appetizer.")
                } else {
                    List {
                        ForEach(orderItems.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        
                        .onDelete(perform: orderItems.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
//                        APButton(title: "$\(orderItems.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(orderItems.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                }
            }
            .navigationTitle("Orders")
            
//                .toolbar {
//                    ToolbarItem(placement: .topBarLeading) {
//                        NavigationTitleView(imageName: "cart.circle",
//                                            title: "Orders",
//                                            color: "5AB2FF")
//                    }
//                }
            
        }
    }
}

#Preview {
    OrderView()
}
