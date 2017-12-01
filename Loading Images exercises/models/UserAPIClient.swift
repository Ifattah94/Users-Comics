//
//  UserAPIClient.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
struct UserAPIClient {
    private init() {}
    static let manager = UserAPIClient()
    func getUsers(from urlStr: String, completionHandler: @escaping ([User]) -> Void, errorHandler: @escaping(AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let usersInfo = try JSONDecoder().decode(UserInfo.self, from: data)
                let users = usersInfo.results
                completionHandler(users)
            }
            catch {
                errorHandler(.couldNotParseJSON(rawError: error))
            }
            }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
        
    }
}
