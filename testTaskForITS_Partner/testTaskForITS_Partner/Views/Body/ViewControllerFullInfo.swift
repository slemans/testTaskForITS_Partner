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
    @IBOutlet weak var imageUser: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        icon.image = serviseAPI.getImagesIcon(gender: userFullInformation.gender)
        createArrayUser(user: userFullInformation)
        print(userFullInformation.picture)
        putImage(image: userFullInformation.picture)
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
        array.append(UserFull(firstPart: "Пол", lastPart: user.gender))
        array.append(UserFull(firstPart: "Широта", lastPart: String(user.latitude)))
        array.append(UserFull(firstPart: "Долгота", lastPart: String(user.longitude)))
        array.append(UserFull(firstPart: "Регистрация", lastPart: user.registered))
        array.append(UserFull(firstPart: "Активация", lastPart: String(user.isActive)))
        array.append(UserFull(firstPart: "Index", lastPart: String(user.index)))
        array.append(UserFull(firstPart: "Guid", lastPart: String(user.guid)))
        array.append(UserFull(firstPart: "Друзья", lastPart: recalculateFriend(user: user)))
        array.append(UserFull(firstPart: "Tag", lastPart: recalculateTagr(user: user)))
    }
    
    func recalculateFriend(user: User) -> String{
        var stringFriend = ""
        for friend in user.friends{
            stringFriend += "Имя: \(friend.name), id: \(friend.id) \n"
        }
        return stringFriend
    }
    func recalculateTagr(user: User) -> String{
        var stringTag = ""
        for tag in user.tags{
            stringTag += " \(tag), "
        }
        return stringTag
    }
    private func putImage(image: String?) {
        guard let image = image,
            let urlImg = URL(string: image) else { return }
        URLSession.shared.dataTask(with: urlImg) { data, _, _ in
            let queue = DispatchQueue.global(qos: .utility)
            queue.async {
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageUser.image = image
                    }
                }
            }
        }.resume()
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
        cell.imageUrl = userFullInformation.picture
        return cell
    }
}
