//
//  InhabitantManager.swift
//  BrastlewarkGame
//
//  Created by Luciano Perez Tiranti on 28/02/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 *  Handles the inahabits array and the api call
 */
class InhabitantManager {

    var inhabitants = NSArray()
    let dataService =  DataService()

    /**
     *  Api call Calling.
     *  Create a array of inhabits.
     *  @return completionHandler (NSArray?, Error?)
     */
    func getInhabits(completionHandler: @escaping (NSArray?, Error?) -> ()) {
        let api = DataService()
        api.getData() { response, error in
            if response != nil {
                let json = JSON(response!)
                if let inabits = json["Brastlewark"].array {
                    let inhabitantsTemp = NSMutableArray()
                    for anInhabitant in inabits {
                        let habitant =  self.parseInhabitant(json: anInhabitant)
                        inhabitantsTemp.add(habitant)
                    }
                    self.inhabitants = inhabitantsTemp as NSArray
                }
                completionHandler(self.inhabitants, nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }

    /**
     *  Parses a specific inhabitans from JSON object
     *  @param JSON
     *  @return Inhabitant
     */
    func parseInhabitant(json: JSON) -> Inhabitant {
        let inhabitant = Inhabitant()
        inhabitant.name = json["name"].string!
        inhabitant.age = json["age"].int!
        inhabitant.weight = json["weight"].float!
        inhabitant.height = json["height"].float!
        inhabitant.hairColor = json["hair_color"].string!
        if let professions = json["professions"].arrayObject as? [String] {
            inhabitant.professions = professions
        }
        if let friends = json["friends"].arrayObject as? [String] {
            inhabitant.friends = friends
        }
        inhabitant.thumbnailUrl =  json["thumbnail"].string!
        return inhabitant
    }
}
