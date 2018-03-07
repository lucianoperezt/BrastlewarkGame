//
//  InhabitantDetailViewControllerTest.swift
//  BrastlewarkGameTests
//
//  Created by Luciano Perez Tiranti on 06/03/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import XCTest

@testable import BrastlewarkGame

class InhabitantDetailViewControllerTest: XCTestCase {
    
    private let inhabitantManager  = InhabitantManager()
    private var appDelegate: AppDelegate!
    private var inhaDetailVC : InhabitantDetailViewController!

    override func setUp() {
        super.setUp()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        inhaDetailVC = storyboard.instantiateViewController(withIdentifier: "InhabitantDetailViewController") as! InhabitantDetailViewController
        inhaDetailVC.inhabilant = InhabitantHelper.getAnInhabitan()
        // Trigger view load and viewDidLoad()
        _ = inhaDetailVC.view
    }

    func testInhabitantDetailViewControllerData() {
        XCTAssertEqual(inhaDetailVC.age.text, "34")
        XCTAssertEqual(inhaDetailVC.name.text, "Jonh")
        XCTAssertEqual(inhaDetailVC.name.text, "Jonh")
        XCTAssertEqual(inhaDetailVC.weight.text, "9.06")
        XCTAssertEqual(inhaDetailVC.height.text, "107.75")
        XCTAssertEqual(inhaDetailVC.hairColor.text, "Pink")
        XCTAssertEqual(inhaDetailVC.hairColor.text, "Pink")
        XCTAssertEqual(inhaDetailVC.inhabilant.professions.count, 2)
        XCTAssertEqual(inhaDetailVC.inhabilant.friends.count, 2)
    }

}
