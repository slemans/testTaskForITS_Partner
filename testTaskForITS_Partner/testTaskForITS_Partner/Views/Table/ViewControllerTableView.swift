//
//  ViewControllerTableView.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import UIKit

class ViewControllerTableView: UIViewController {

    @IBOutlet weak var repeatBt: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentControlGender: UISegmentedControl!
    @IBOutlet weak var segmentControlAge: UISegmentedControl!
    @IBOutlet weak var secondView: UIView!
    
    var users: [User] = []
    var oldArrayUsers: [User] = []
    var filterUsers: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUrlSession()
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
            segmentControlAge.selectedSegmentIndex = 0
            users.removeAll()
            OtherFuncFor.otherFuncSingl.seachGenderUser(gender: .famale, oldArrayUsers: oldArrayUsers) { complition in
                users = complition
            } arrayUsersOld: { complitionTwo in
                filterUsers = complitionTwo
            }
            tableView.reloadData()
        case 2:
            segmentControlAge.selectedSegmentIndex = 0
            users.removeAll()
            OtherFuncFor.otherFuncSingl.seachGenderUser(gender: .male, oldArrayUsers: oldArrayUsers) { complition in
                users = complition
            } arrayUsersOld: { complitionTwo in
                filterUsers = complitionTwo
            }
            tableView.reloadData()
        default:
            segmentControlAge.selectedSegmentIndex = 0
            users = oldArrayUsers
            tableView.reloadData()
        }
    }

    
    @IBAction func segmentedControlAgeAct(_ sender: UISegmentedControl) {
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
            if oldArrayUsers.count == users.count{
                users = oldArrayUsers
                tableView.reloadData()
            } else {
                users = filterUsers
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func repiatBtAct() {
        users.removeAll()
        segmentControlGender.selectedSegmentIndex = 0
        segmentControlAge.selectedSegmentIndex = 0
        tableView.reloadData()
        getUrlSession()
    }
    private func getUrlSession() {
        ServiseAPI.apiSingl.fetchUrlSession { [weak self] users in
            self?.oldArrayUsers = users
            self?.users = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activitiIndicator.stopAnimating()
                    self?.secondView.alpha = 0
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
