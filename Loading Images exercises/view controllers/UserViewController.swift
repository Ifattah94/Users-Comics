//
//  ViewController.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var userTableView: UITableView!
    
    var users = [User]() {
        didSet {
            self.userTableView.reloadData()
        }
    }
    
    
    func loadData() {
        let urlStr = "https://randomuser.me/api/?results=40"
        let completion: ([User]) -> Void = {(onlineUsers: [User]) in
            self.users = onlineUsers
        }
        let errorHandler: (AppError) -> Void = {(error: AppError) in
            print(error)
        }
        UserAPIClient.manager.getUsers(from: urlStr, completionHandler: completion, errorHandler: errorHandler)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedUser = self.users[indexPath.row]
        guard let userCell = userTableView.dequeueReusableCell(withIdentifier: "User Cell", for: indexPath) as? UserTableViewCell else {return UITableViewCell()}
        userCell.nameLabel.text = selectedUser.name.first + " " + selectedUser.name.last
        userCell.ageLabel.text = selectedUser.age.description
        userCell.phoneNumberLabel.text = selectedUser.cell
        userCell.userImageView.image = nil 
        let imageUrlStr = selectedUser.picture.large
        let completion: (UIImage) -> Void = {(onlineImage: UIImage) in
            userCell.userImageView.image = onlineImage
            userCell.setNeedsLayout()
        }
        ImageAPICLient.manager.getImage(from: imageUrlStr,
                                        completionHandler: completion,
                                        errorHandler: {print($0)})
        return userCell
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationDVC = segue.destination as? UserDetailViewController {
            destinationDVC.myUser = users[userTableView.indexPathForSelectedRow!.row]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
        loadData()
        
    }



}

