//
//  Comic API Client.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class ComicAPIClient {
    private init() {}
    static let manager = ComicAPIClient()
    func getComics(from urlStr: String, completionHandler: @escaping (Comic) -> Void, errorHandler: @escaping(AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let comicInfo = try JSONDecoder().decode(Comic.self, from: data)
               let comic = comicInfo
                completionHandler(comic)
            }
            catch {
                errorHandler(.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
