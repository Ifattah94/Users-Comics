//
//  UserDetailViewController.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    var myUser: User!
    
    @IBOutlet weak var bigImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    
    func loadImage() {
    let imageURLStr = myUser.picture.large
    let completion: (UIImage) -> Void = {(onlineImage: UIImage) in
        self.bigImageView.image = onlineImage
        self.bigImageView.setNeedsLayout()
        }
        ImageAPICLient.manager.getImage(from: imageURLStr,
                                        completionHandler: completion,
                                        errorHandler: {print($0)})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myUser.name.first + " " + myUser.name.last
        ageLabel.text = myUser.age.description
        phoneNumberLabel.text = myUser.cell + " " + myUser.phone
        locationLabel.text = myUser.location.street + " " + myUser.location.city + " " + myUser.location.state
        loadImage()

        // Do any additional setup after loading the view.
    }



}
