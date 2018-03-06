//
//  InhabitantHelper.swift
//  BrastlewarkGameTests
//
//  Created by Luciano Perez Tiranti on 05/03/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import Foundation
import SwiftyJSON

class InhabitantHelper {

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
}
