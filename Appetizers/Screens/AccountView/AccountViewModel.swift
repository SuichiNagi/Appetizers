//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/11/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var userModel = UserModel()
    @Published var alertItem: AlertItem?
    @Published var isShowRetrieveView = false
    
    var isValidForm: Bool {
        guard !userModel.firstName.isEmpty && !userModel.lastName.isEmpty && !userModel.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard userModel.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    // reset after saved
    func resetAfterSaved() {
        userModel.firstName = ""
        userModel.lastName = ""
        userModel.email = ""
        userModel.birthdate = Date()
        userModel.extraNapkins = false
        userModel.frequentRefills = false
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(userModel)
            userData = data
            alertItem = AlertContext.userSaveSuccess
            
            resetAfterSaved()
            isShowRetrieveView = true
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData else { return }
        
        do {
            userModel = try JSONDecoder().decode(UserModel.self, from: userData)
            isShowRetrieveView = false
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func userDataNotEmpty() {
        guard userData != nil else {
            return isShowRetrieveView = false
        }
        
        guard !userModel.firstName.isEmpty && !userModel.lastName.isEmpty && !userModel.email.isEmpty else {
            return isShowRetrieveView = true
        }
    }
}
