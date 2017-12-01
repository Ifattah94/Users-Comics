//
//  Model for Location.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
/*
struct Results: Codable {
    let results: [Contact]
}
struct Contact: Codable {
    let gender: String
    let email: String
    let phone: String
    let cell: String
    let dob: String
    let name: NameWraper
    let location: LocationWraper
    let picture: PictureWraper?
}
struct NameWraper: Codable {
    let title: String
    let first: String
    let last: String
}
struct LocationWraper: Codable {
    //    let street: String
    //    let city: String
    var contactState: String
    var postCodeInt: Int?
    var postCodeStr: String?
    
    enum CodingKeys: String, CodingKey {
        case contactState = "state"
        case postCodeInt = "postcode"
        //case postCodeStr
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.contactState = try values.decode(String.self, forKey: .contactState)
        if let pcStr = try? values.decode(String.self, forKey: .postCodeInt) {
            self.postCodeStr = pcStr
        } else if let pcInt = try? values.decode(Int.self, forKey: .postCodeInt) {
            self.postCodeInt = pcInt
        }
    }
}
struct PictureWraper: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
*/
