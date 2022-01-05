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
    private var users: [User] = []
    var serviseAPI = ServiseAPI()
    
    
    
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
        }
    }
    @IBAction func repiatBtAct() {
        print("Обвновление данных")
    }
    func getUrlSession() {
        serviseAPI.fetchUrlSession() { [weak self] users in
            self?.users = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
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
