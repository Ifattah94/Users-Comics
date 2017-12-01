//
//  Comic.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
struct Comic: Codable {
    let num: Int
    let img: String

    static let initialComic = Comic(num: 1922, img: "https://imgs.xkcd.com/comics/the_moon_and_the_great_wall.png")
    
    static func getRandomNum() -> Int {
       return Int(arc4random_uniform(1921))
    }
    
}
