//
//  ViewControllerTableView.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import UIKit
//import SwiftyJSON

class ViewControllerTableView: UIViewController {

    @IBOutlet weak var repeatBt: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    var serviseAPI = ServiseAPI()
    var users: [User] = []
    var oldArrayUsers: [User] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUrlSession()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ViewControllerFullInfoVC = segue.destination as? ViewControllerFullInfo {
            if let indexPath = tableView.indexPathForSelectedRow {
                ViewControllerFullInfoVC.userFullInformation = users[indexPath.row]
            }
        } else if let segueMapVc = segue.destination as? MapVc {
            segueMapVc.users = users
        }
    }
    @IBAction func segmentedControlGramedAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            print("Женщины")
            seachGenderUser(gender: .famale)
        case 2:
            print("Мужик")
            seachGenderUser(gender: .male)
        default:
            users = oldArrayUsers
            tableView.reloadData()
        }
    }
    
    func seachGenderUser(gender: Gender){
        users.removeAll()
        switch gender {
        case .famale:
            for user in oldArrayUsers{
                if user.gender == "female"{
                    users.append(user)
                }
            }
            tableView.reloadData()
        default:
            for user in oldArrayUsers{
                if user.gender == "male"{
                    users.append(user)
                }
            }
            tableView.reloadData()
        }
        
        
    }
    
    @IBAction func segmentedControlAgeФсешщт(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            let decrease = users.sorted { $0.age > $1.age }
            users = decrease
            tableView.reloadData()
        case 2:
            let increases = users.sorted { $0.age < $1.age }
            users = increases
            tableView.reloadData()
        default:
            users = oldArrayUsers
            tableView.reloadData()
        }
    }
    
    

    
    
    @IBAction func repiatBtAct() {
        users.removeAll()
        tableView.reloadData()
        getUrlSession()
    }
    func getUrlSession() {
        serviseAPI.fetchUrlSession() { [weak self] users in
            self?.oldArrayUsers = users
            self?.users = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activitiIndicator.stopAnimating()
                }
        }
    }


}

extension ViewControllerTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let user = users[indexPath.row]
        cell.fetchDataUser(user: user)
        return cell
    }
   
}
