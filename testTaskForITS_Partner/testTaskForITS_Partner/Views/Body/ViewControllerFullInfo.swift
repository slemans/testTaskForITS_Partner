//
//  ViewControllerFullInfo.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 4.01.22.
//

import UIKit

class ViewControllerFullInfo: UIViewController {
    @IBOutlet var icon: UIImageView!
    @IBOutlet var imageUser: UIImageView!

    var array: [UserFull] = []
    var userFullInformation: User!
    let otherFuncForProject = OtherFuncForWorkWithView.otherFuncSingl

    override func viewDidLoad() {
        super.viewDidLoad()
        icon.image = otherFuncForProject.getImagesIcon(gender: userFullInformation.gender)
        array = otherFuncForProject.createArrayUser(user: userFullInformation)
        putImage(image: userFullInformation.picture)
        navigationItem.title = userFullInformation.name
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if let MapVc = segue.destination as? MapVc {
            MapVc.latitude = userFullInformation.latitude
            MapVc.longitude = userFullInformation.longitude
            MapVc.nameUser = userFullInformation.name
        }
    }

    private func putImage(image: String?) {
        guard let image = image,
              let urlImg = URL(string: image) else { return }
        URLSession.shared.dataTask(with: urlImg) { [weak self] data, _, _ in
            let queue = DispatchQueue.global(qos: .utility)
            queue.async {
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageUser.image = image
                    }
                }
            }
        }.resume()
    }

    @IBAction func returnBt(_: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ViewControllerFullInfo: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFull", for: indexPath) as! TableViewCellFull
        let userInfo = array[indexPath.row]
        cell.fetchDataUserFull(userFull: userInfo)
        cell.imageUrl = userFullInformation.picture
        return cell
    }
}
