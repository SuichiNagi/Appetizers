//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/7/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [AppetizerModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: AppetizerModel?
    
//    func getAppetizers() {
//        self.isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                        
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetizers() {
        self.isLoading = true
       
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
    
    func refreshData() async {
        // Simulate network request or data update
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000) // 2 seconds delay
          
        // Update the data
//        await MainActor.run { //it make sures that the getAppetizers is called on the main thread
        getAppetizers()
//        }
    }
}
