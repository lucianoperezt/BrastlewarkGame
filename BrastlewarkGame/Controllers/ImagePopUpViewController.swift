//
//  ImagePopUpViewController.swift
//  BrastlewarkGame
//
//  Created by Luciano Perez Tiranti on 07/03/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import UIKit

/*
 * Represents a popup that show a inhabitant image
 */
class ImagePopUpViewController: UIViewController {
    var imageURL : String!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.loadImageUsingCache(withUrl:imageURL)
    }

    @IBAction func closeButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
