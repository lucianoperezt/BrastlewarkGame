//
//  UIImageView+LoadImageUsingCache.swift
//  BrastlewarkGame
//
//  Created by Luciano Perez Tiranti on 03/03/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

/*
 * UImageView Extension that handles loading images using cache and setting image as rounded
 */
extension UIImageView {
    
    /**
     *  Loading images using cache
     *  If image was downloaded before it returns the cache image otherwise download it
     *  @param url
     */
     public func loadImageUsingCache(withUrl urlString: String) {
        let url = URL(string: urlString)
        self.image = nil
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
        }).resume()
    }

    /**
     *  Setting an image as rounded
     */
    public func setRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderColor = UIColor.gray.cgColor
        self.clipsToBounds = true
    }
}
