//
//  ViewControllerTableView.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import UIKit

class ViewControllerTableView: UIViewController {
    @IBOutlet var repeatBt: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activitiIndicator: UIActivityIndicatorView!
    @IBOutlet var segmentControlGender: UISegmentedControl!
    @IBOutlet var segmentControlAge: UISegmentedControl!
    @IBOutlet var secondView: UIView!

    var users: [User] = []
    var oldArrayUsers: [User] = []
    var filterUsers: [User] = []
    let otherFuncForProject = OtherFuncForWorkWithView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getUrlSession()
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if let ViewControllerFullInfoVC = segue.destination as? ViewControllerFullInfo {
            if let indexPath = tableView.indexPathForSelectedRow {
                ViewControllerFullInfoVC.userFullInformation = users[indexPath.row]
            }
        } else if let segueMapVc = segue.destination as? MapVc {
            segueMapVc.users = users
        }
    }

    @IBAction func segmentedControlGramedAction(_ sender: UISegmentedControl) {
        segmentControlAge.selectedSegmentIndex = 0
        otherFuncForProject.fetchFoundArrayUserForGender(sender.selectedSegmentIndex, oldArrayUsers) { arrayOne, arrayTwo in
            users = arrayOne
            if let arrayTwo = arrayTwo {
                filterUsers = arrayTwo
            }
        }
        tableView.reloadData()
    }

    @IBAction func segmentedControlAgeTableView(_ sender: UISegmentedControl) {
        users = otherFuncForProject.sortedUsersArrayForAge(sender.selectedSegmentIndex, users, oldArrayUsers, filterUsers)
        tableView.reloadData()
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
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let user = users[indexPath.row]
        cell.fetchDataUser(user: user)
        return cell
    }
}
