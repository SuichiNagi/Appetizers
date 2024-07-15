//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/5/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = OrderModel()
    
    var body: some Scene {
        WindowGroup {
//            AppetizerTabView().environmentObject(order) //EnvironmentObject - accessed by several views deep in the hierarchy.
            AppetizerTabView().environment(order)
        }
    }
}
