//
//  InhabitantViewControllerTest.swift
//  BrastlewarkGameTests
//
//  Created by Luciano Perez Tiranti on 06/03/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import XCTest

@testable import BrastlewarkGame

class InhabitantViewControllerTest: XCTestCase {

    private let inhabitantManager  = InhabitantManager()
    private var appDelegate: AppDelegate!
    private var inhaVC : InhabitantsViewController!

    override func setUp() {
        super.setUp()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        inhaVC = storyboard.instantiateViewController(withIdentifier: "InhabitantViewController") as! InhabitantsViewController
        inhaVC.beginAppearanceTransition(true, animated: false)

        let habitantsMock = [InhabitantHelper.getAnInhabitan(),InhabitantHelper.getAnInhabitan()]
        inhaVC.habitants = habitantsMock
        // Trigger view load and viewDidLoad()
        _ = inhaVC.view
        inhaVC.tableView.reloadData()
    }
    
    func testInhabitantDetailViewControllerData() {
        let tableView = inhaVC.tableView
        let subViews = inhaVC.view.subviews
        XCTAssertEqual(tableView?.dataSource?.tableView(tableView!, numberOfRowsInSection: 0),2)
        XCTAssertTrue(subViews.contains(inhaVC.tableView), "View does not have a table subview")
        XCTAssertTrue(inhaVC.errorMessage.isHidden)
        XCTAssertTrue(inhaVC.reloadButton.isHidden)
    }

}
