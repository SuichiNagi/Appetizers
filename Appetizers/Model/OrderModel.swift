//
//  OrderModel.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/13/24.
//

import SwiftUI

@Observable class OrderModel /*ObservableObject*/ {
    
    /*@Published*/ var items: [AppetizerModel] = []
    
    /*@Published*/ var isShowMessage = false
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
    
    func add(_ appetizer: AppetizerModel) {
        items.append(appetizer)
        
        self.isShowMessage = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isShowMessage = false
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

