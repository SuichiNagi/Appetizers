//
//  AccountView.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/5/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.userModel.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.userModel.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.userModel.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
//                    DatePicker("Birthday", selection: $viewModel.userModel.birthdate, in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    DatePicker("Birthday", selection: $viewModel.userModel.birthdate, in: Date().oneHundredTenYearsAgo...Date(), displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Request")) {
                    Toggle("Extra Napkin", isOn: $viewModel.userModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.userModel.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
                if viewModel.isShowRetrieveView {
                    Section(header: Text("Retrieve Data")) {
                        Button {
                            viewModel.retrieveUser()
                        } label: {
                            Text("Retrieve Data")
                        }
                    }
                }
            }
//                .toolbar {
//                    ToolbarItem(placement: .topBarLeading) {
//                        NavigationTitleView(imageName: "person.crop.circle",
//                                            title: "Account",
//                                            color: "FF5000")
//                    }
//                }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear() {
            viewModel.userDataNotEmpty()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
