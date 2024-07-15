//
//  UserModel.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/12/24.
//

import Foundation

struct UserModel: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
