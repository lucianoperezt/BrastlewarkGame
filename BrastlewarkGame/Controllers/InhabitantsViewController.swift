//
//  ViewController.swift
//  BrastlewarkGame
//
//  Created by Luciano Perez Tiranti on 27/02/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import UIKit

class InhabitantsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
    
    var habitants = [Inhabitant]()
    var habitansFilter = [Inhabitant]()
    var selectInhabitant: Inhabitant!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        setUpTableView()
        loadDataFromApi()
    }
    
    // Mark: Setup tableview
    private func setUpTableView() {
        self.tableView.register(UINib(nibName:"InhabitanTableViewCell", bundle: nil), forCellReuseIdentifier: "customCellIdentifier")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // Mark: Setup searchbar delegate
    private func setUpSearchBar() {
        self.searchBar.delegate = self
    }

    // Mark: loading data from api
    private func loadDataFromApi(){
        let api = InhabitantManager()
        
        //hidded the error message
        setErrorMessage(false)
        //show loding indicator
        self.showActivityIndicator(true)
        //setting as hiddedn the tableview
        self.tableView.isHidden = true

        api.getInhabits() { responseObject, error in
            if responseObject != nil && responseObject!.count > 0 {
                self.habitansFilter = responseObject as! [Inhabitant]
                self.habitants = responseObject as! [Inhabitant]
                self.tableView.reloadData()
                self.setErrorMessage(false)
                self.tableView.isHidden = false
            } else {
                self.setErrorMessage(true)
            }
            self.showActivityIndicator(false)
        }
    }

    //Set the error message and reload buttom for networking problems
    func setErrorMessage(_ enabled: Bool){
        self.errorMessage.isHidden = !enabled
        self.reloadButton.isHidden = !enabled
    }

    //show activity indicator according to the param passed
    func showActivityIndicator(_ enabled: Bool) {
        if enabled {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
        activityIndicator.isHidden = !enabled
    }

    // Mark: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.habitants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellIdentifier", for: indexPath) as! InhabitanTableViewCell
        
        let inha = self.habitants[indexPath.row]
        cell.name.text = inha.name
        cell.age.text = "Age: \(inha.age)"
        cell.friends.text = "Friends: \(inha.friends.count)"
        cell.professions.text = "Professions: \(inha.professions.count)"
        cell.iconImage.loadImageUsingCache(withUrl: inha.thumbnailUrl)
        cell.iconImage.setRounded()
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let inhabitant = self.habitants[indexPath.row]
        self.selectInhabitant = inhabitant
        performSegue(withIdentifier: "InhabitanSegueIdentifer", sender: self)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }

    // Mark: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "InhabitanSegueIdentifer") {
            let viewController = segue.destination as! InhabitantDetailViewController
            viewController.inhabilant = self.selectInhabitant
        }
    }

    // Mark: SearcBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       if searchBar.text! == "" {
            habitants = habitansFilter
        } else {
            habitants = habitansFilter.filter({ (inhabitant) -> Bool in
                return inhabitant.name.lowercased().contains(searchBar.text!.lowercased())
            })
        }
       tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }

    // Mark: reloadData action button
    @IBAction func reloadData(_ sender: Any) {
        loadDataFromApi()
    }
}

