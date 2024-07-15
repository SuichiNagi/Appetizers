//
//  Appetizer.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/6/24.
//

import Foundation

struct AppetizerModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [AppetizerModel]
}

struct MockData {
    
    static let sampleAppetizer = AppetizerModel(id: 0001, 
                                           name: "Test Appertizer",
                                           description: "Description Test",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 9, 
                                           protein: 9,
                                           carbs: 9)
    
    static let sampleAppetizer1 = AppetizerModel(id: 0002,
                                           name: "Test Appertizer",
                                           description: "Description Test",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 9,
                                           protein: 9,
                                           carbs: 9)
    
    static let sampleAppetizer2 = AppetizerModel(id: 0003,
                                           name: "Test Appertizer",
                                           description: "Description Test",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 9,
                                           protein: 9,
                                           carbs: 9)
    
    static let sampleAppetizer3 = AppetizerModel(id: 0004,
                                           name: "Test Appertizer",
                                           description: "Description Test",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 9,
                                           protein: 9,
                                           carbs: 9)
    
    
    static let appetizers = [sampleAppetizer, sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
}
