//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/5/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
//    @EnvironmentObject var order: OrderModel
    @Environment(OrderModel.self) var order

    var body: some View {
        ZStack {
            NavigationView {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    List(viewModel.appetizers) { appetizer in
                       AppetizerListCell(appetizer: appetizer)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                viewModel.selectedAppetizer = appetizer
                                viewModel.isShowingDetail = true
                            }
                    }
                    
        //            .toolbar {
        //                ToolbarItem(placement: .topBarLeading) {
        //                    NavigationTitleView(imageName: "fork.knife.circle",
        //                                        title: "Appetizers",
        //                                        color: "40A578")
        //                }
        //            }
                    
                    .listStyle(.plain)
                    .navigationTitle("Appetizers")
                    .disabled(order.isShowMessage || viewModel.isShowingDetail ? true : false)
                    .refreshable {
                        await viewModel.refreshData()
                    }
                }
            }
            .onAppear { //close the appetizer detail when changing tab section
                if (viewModel.isShowingDetail) {
                    viewModel.isShowingDetail = false
                }
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            //if successful added in the order
            if order.isShowMessage {
               SuccessMessageView(title: "Successfully Added")
            }
        }
        .animation(.easeInOut(duration: 0.6), value: order.isShowMessage)
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
