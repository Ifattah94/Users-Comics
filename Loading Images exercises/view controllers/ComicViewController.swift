//
//  ComicViewController.swift
//  Loading Images exercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController {

    
    @IBOutlet weak var comicImageView: UIImageView!
    
    @IBOutlet weak var currentComicNumLabel: UILabel!
    
    @IBOutlet weak var comicNumStepper: UIStepper!
    
    
    @IBOutlet weak var comicTextField: UITextField!
    
   
    @IBAction func mostRecentButtonPressed(_ sender: UIButton) {
      currentNum = 1922
      comicNumStepper.value = Double(currentNum)
    
    }
    
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        self.currentNum = Comic.getRandomNum()
        comicNumStepper.value = Double(currentNum)
    }
  
    var comic: Comic = Comic.initialComic {
        didSet {
            let imageUrlStr = self.comic.img
            self.currentComicNumLabel.text = "\(self.currentNum)"
            self.comicImageView.image = nil
            let imageCompletion:(UIImage) -> Void = {(onlineImage: UIImage) in
                self.comicImageView.image = onlineImage
                self.comicImageView.setNeedsLayout()
                
            }
            
            ImageAPICLient.manager.getImage(from: imageUrlStr, completionHandler: imageCompletion, errorHandler: {print($0)})
        }
    }
    
    
    var currentNum: Int = 1922 {
        didSet {
            loadComics()
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        currentNum = Int(sender.value)
        comicNumStepper.value = Double(currentNum)
    }
    
    func loadComics() {
        let urlStr = "https://xkcd.com/\(currentNum)/info.0.json"
        let completion: (Comic) -> Void = {(onlineComic: Comic) in
            self.comic = onlineComic
        }
        ComicAPIClient.manager.getComics(from: urlStr, completionHandler: completion, errorHandler: {print($0)})
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.comicNumStepper.value = Double(currentNum)
        comicTextField.delegate = self
        loadComics()

        // Do any additional setup after loading the view.
    }

}

extension ComicViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {return false}
        guard let textAsInt = Int(text) else {self.currentComicNumLabel.text = "Enter only numbers"; return false}
        currentNum = textAsInt
        comicNumStepper.value = Double(currentNum)
        textField.text = ""
       comicTextField.resignFirstResponder()
        return true
    }
  
}






