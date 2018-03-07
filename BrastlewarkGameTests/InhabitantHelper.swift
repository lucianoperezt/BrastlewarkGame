//
//  InhabitantHelper.swift
//  BrastlewarkGameTests
//
//  Created by Luciano Perez Tiranti on 05/03/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import Foundation
import SwiftyJSON

@testable import BrastlewarkGame

/*
 * Helper to mock data
 */
class InhabitantHelper {

    /*
     * Returns an Inhabitant with JSON format
     */
    static func getAnInhabitanJson() -> JSON {
        return JSON( [
            "id": 0,
            "name": "Tobus Quickwhistle",
            "thumbnail": "http://www.publicdomainpictures.net/pictures/10000/nahled/thinking-monkey-11282237747K8xB.jpg",
            "age": 306,
            "weight": 39.065952,
            "height": 107.75835,
            "hair_color": "Pink",
            "professions": [
                "Metalworker",
                "Woodcarver",
                "Stonecarver",
                " Tinker",
                "Tailor",
                "Potter"
            ],
            "friends": [
                "Cogwitz Chillwidget",
                "Tinadette Chillbuster"
            ]
        ] as [String : Any])
    }
    
    /*
     * Returns an Inhabitant
     */
    static func getAnInhabitan() -> Inhabitant {
        let inha = Inhabitant()
        inha.name = "Jonh"
        inha.thumbnailUrl = "http://www.publicdomainpictures.net/pictures/10000/nahled/thinking-monkey-11282237747K8xB.jpg"
        inha.age = 34
        inha.weight = 9.06
        inha.height = 107.75
        inha.hairColor = "Pink"
        inha.professions = ["Some", "Some"]
        inha.friends = ["More", "More"]
        return inha

    }
}
