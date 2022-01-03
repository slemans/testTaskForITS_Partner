//
//  ViewControllerTableView.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import UIKit
//import SwiftyJSON

class ViewControllerTableView: UIViewController {

    @IBOutlet weak var table: UITableView!
    private var users: [User] = []
    var serviseAPI = ServiseAPI()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gethData()
        // Do any additional setup after loading the view.
    }
    
//    private func getUrlSession(type user: User) {
//        serviseAPI.fetchUrlSession() { users in
//            self.users = users
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//        }
//    }

    
    func gethData() {
        let jsonUrl = "https://json-generator.com/api/json/get/clyWAUbaxu?indent=2"
        guard let url = URL(string: jsonUrl) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
//            let json = JSON(value)
            print(data)
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
                
                print(self.users)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                print(self.users)
                self.table.reloadData()
            }
        }
        task.resume()
    }


}

extension ViewControllerTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        return cell
    }
    

    
    
}
