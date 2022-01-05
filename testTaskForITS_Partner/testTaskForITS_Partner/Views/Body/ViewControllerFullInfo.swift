//
//  ViewControllerFullInfo.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 4.01.22.
//

import UIKit

class ViewControllerFullInfo: UIViewController {

    @IBOutlet weak var icon: UIImageView!
    
    var array: [UserFull] = []
    var serviseAPI = WorkWithImage()
    var userFullInformation: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        icon.image = serviseAPI.getImagesIcon(gender: userFullInformation.gender)
        createArrayUser(user: userFullInformation)
        navigationItem.title = userFullInformation.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let MapVc = segue.destination as? MapVc {
            MapVc.latitude = userFullInformation.latitude
            MapVc.longitude = userFullInformation.longitude
            MapVc.nameUser = userFullInformation.name
        }
    }
    
    func createArrayUser(user: User){
        array.append(UserFull(firstPart: "Телефон", lastPart: user.phone))
        array.append(UserFull(firstPart: "Email", lastPart: user.email))
        array.append(UserFull(firstPart: "Компания", lastPart: user.company))
        array.append(UserFull(firstPart: "Возраст", lastPart: String(user.age)))
        array.append(UserFull(firstPart: "Цвет глаз", lastPart: user.eyeColor))
        array.append(UserFull(firstPart: "Средств", lastPart: user.balance))
        array.append(UserFull(firstPart: "Id", lastPart: user.id))
        array.append(UserFull(firstPart: "Адресс", lastPart: user.address))
        array.append(UserFull(firstPart: "Любимый фрукт", lastPart: user.favoriteFruit))
        array.append(UserFull(firstPart: "Дата регистрации", lastPart: user.registered))
        array.append(UserFull(firstPart: "Описание", lastPart: user.about))
        array.append(UserFull(firstPart: "Сообщения", lastPart: user.greeting))
    }
    @IBAction func returnBt(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }

}

extension ViewControllerFullInfo: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFull", for: indexPath) as! TableViewCellFull
        let userInfo = array[indexPath.row]
        cell.fetchDataUserFull(userFull: userInfo)
        return cell
    }
}
