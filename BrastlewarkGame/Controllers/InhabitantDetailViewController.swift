//
//  InhabitantDetailViewController.swift
//  BrastlewarkGame
//
//  Created by Luciano Perez Tiranti on 28/02/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import UIKit

class InhabitantDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var professionTitle: UILabel!
    @IBOutlet weak var professionTableView: UITableView!
    @IBOutlet weak var friendsTitle: UILabel!
    @IBOutlet weak var friendsTableView: UITableView!
    
    var inhabilant : Inhabitant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViews()
        setData()
    }
    
    // Mark: set tableview delegate and datasource
    private func setUpTableViews () {
        self.friendsTableView.delegate = self
        self.friendsTableView.dataSource = self
        self.professionTableView.delegate = self
        self.professionTableView.dataSource = self
    }
    
    // Mark: setData
    private func setData () {
        if(inhabilant != nil){
            self.name.text = inhabilant.name
            self.age.text = String(inhabilant.age)
            self.height.text = String(inhabilant.height)
            self.weight.text = String(inhabilant.weight)
            self.hairColor.text = inhabilant.hairColor
            self.friendsTitle.text = "\(inhabilant.friends.count) friends"
            self.professionTitle.text =  "\(inhabilant.professions.count) professions"
            self.image.loadImageUsingCache(withUrl:inhabilant.thumbnailUrl)
            self.image.setRounded()
        }
    }

    // Mark: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.friendsTableView) {
            return inhabilant.friends.count
        } else {
            return inhabilant.professions.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if(tableView == self.friendsTableView) {
            cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath)
            let name = inhabilant.friends[indexPath.row]
            cell.textLabel!.text = name
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "professionsCell", for: indexPath)
            let name = inhabilant.professions[indexPath.row]
            cell.textLabel!.text = name
        }
        cell.textLabel!.textColor = UIColor.lightGray
        cell.textLabel!.textAlignment = .center
        return cell
    }

    //Returns the row height for friendstableview and professionaltableview
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
    

}
