//
//  DataService.swift
//  BrastlewarkGame
//
//  Created by Luciano Perez Tiranti on 28/02/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import Foundation
import Alamofire

/*
 * Class that handles networking calls
 */
class DataService {
    //api url
    let apiUrl: String!

    init() {
        self.apiUrl = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
    }

    /*
     * Method that handles the networking api call with alamofire library
     * return completionHandler (NSDictionary?, Error?)
     */
    func getData(completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
        var originalRequest = try! URLRequest(url: self.apiUrl, method: .get)
        originalRequest.cachePolicy = .reloadIgnoringLocalCacheData

        Alamofire.request(originalRequest)
            .responseJSON { response in
                switch response.result {
                    case .success(let value):
                        completionHandler(value as? NSDictionary, nil)
                    case .failure(let error):
                        completionHandler(nil, error)
                }
        }
    }
}
