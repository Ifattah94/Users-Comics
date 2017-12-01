//
//  UserInfo.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
struct UserInfo: Codable {
    var results: [User]
}

struct User: Codable {
    var name: NameWrapper
    var location: LocationInfo
    let picture: PictureWrapper
    let dob: String
    let phone: String
    let cell: String
    var age: Int {
        if let ageInt = Int(dob.prefix(4)) {
            return 2017 - ageInt
        } else {return -1}
}
}
struct NameWrapper: Codable {
    var title: String
    var first: String
    var last: String
}

struct LocationInfo: Codable {
    let street: String
    let city: String
    let state: String
}

struct PictureWrapper: Codable {
    let large: String
    let medium: String
    let thumbnail: String 
}
