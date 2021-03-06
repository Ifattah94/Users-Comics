//
//  Image API Client.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
import UIKit
class ImageAPICLient {
    private init() {}
    static let manager = ImageAPICLient()
    func getImage(from urlStr: String, completionHandler: @escaping (UIImage) -> Void, errorHandler: @escaping (AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else {
                return
            }
            completionHandler(onlineImage)
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
