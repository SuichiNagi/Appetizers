//
//  ContentView.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/5/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
//    @EnvironmentObject var order: OrderModel
    @Environment(OrderModel.self) var order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
