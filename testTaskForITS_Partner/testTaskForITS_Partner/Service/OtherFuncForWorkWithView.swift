//
//  WorkWithImage.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 5.01.22.
//

import UIKit

class OtherFuncForWorkWithView {

    // for CollectionViewCell, TableViewCell
    public func getImagesIcon(gender: Gender) -> UIImage {
        if gender == .male {
            return #imageLiteral(resourceName: "iconFamale")
        } else {
            return #imageLiteral(resourceName: "male")
        }
    }

    func choseColor(gender: Gender) -> UIColor {
        if gender == .male {
            return #colorLiteral(red: 1, green: 0.09483547046, blue: 0.01818972419, alpha: 1)
        } else {
            return #colorLiteral(red: 0.1508811976, green: 0.211440719, blue: 1, alpha: 1)
        }
    }

    // for ViewControllerCollection, ViewControllerTableView
    private func sortedUsersArrayForGender(gender: Gender, oldArrayUsers: [User], completion: ([User], [User]) -> Void) {
        var filterUsers: [User] = []
        var users: [User] = []
        switch gender {
        case .female:
            for user in oldArrayUsers {
                if user.gender == .female {
                    users.append(user)
                }
            }
            filterUsers = users
            completion(users, filterUsers)
        default:
            for user in oldArrayUsers {
                if user.gender == .male {
                    users.append(user)
                }
            }
            filterUsers = users
            completion(users, filterUsers)
        }
    }

    func sortedUsersArrayForAge(_ segmentedControl: Int, _ users: [User], _ oldArrayUsers: [User], _ filterUsers: [User]) -> [User] {
        switch segmentedControl {
        case 1:
            return users.sorted { $0.age > $1.age }
        case 2:
            return users.sorted { $0.age < $1.age }
        default:
            if oldArrayUsers.count == users.count {
                return oldArrayUsers
            } else {
                return filterUsers
            }
        }
    }

    func fetchFoundArrayUserForGender(_ selectedSegmentIndex: Int, _ oldArrayUsers: [User], completion: ([User], [User]?) -> Void) {
        switch selectedSegmentIndex {
        case 1:
            sortedUsersArrayForGender(gender: .male, oldArrayUsers: oldArrayUsers) { arrayOne, arrayTwo in
                completion(arrayOne, arrayTwo)
            }
        case 2:
            sortedUsersArrayForGender(gender: .female, oldArrayUsers: oldArrayUsers) { arrayOne, arrayTwo in
                completion(arrayOne, arrayTwo)
            }
        default:
            let users = oldArrayUsers
            completion(users, nil)
        }
    }

    // for ViewControllerFullInfo
    func createArrayUser(user: User) -> [UserFull] {
        var array: [UserFull] = []
        array.append(UserFull(firstPart: Parametrs.telefon.rawValue, lastPart: user.phone))
        array.append(UserFull(firstPart: Parametrs.email.rawValue, lastPart: user.email))
        array.append(UserFull(firstPart: Parametrs.company.rawValue, lastPart: user.company))
        array.append(UserFull(firstPart: Parametrs.age.rawValue, lastPart: String(user.age)))
        array.append(UserFull(firstPart: Parametrs.colorEyes.rawValue, lastPart: user.eyeColor))
        array.append(UserFull(firstPart: Parametrs.means.rawValue, lastPart: user.balance))
        array.append(UserFull(firstPart: Parametrs.id.rawValue, lastPart: user.id))
        array.append(UserFull(firstPart: Parametrs.adress.rawValue, lastPart: user.address))
        array.append(UserFull(firstPart: Parametrs.loveVegeteble.rawValue, lastPart: user.favoriteFruit))
        array.append(UserFull(firstPart: Parametrs.dateRegistration.rawValue, lastPart: user.registered))
        array.append(UserFull(firstPart: Parametrs.description.rawValue, lastPart: user.about))
        array.append(UserFull(firstPart: Parametrs.messages.rawValue, lastPart: user.greeting))
        array.append(UserFull(firstPart: Parametrs.gender.rawValue, lastPart: user.gender.rawValue))
        array.append(UserFull(firstPart: Parametrs.latitude.rawValue, lastPart: String(user.latitude)))
        array.append(UserFull(firstPart: Parametrs.longitude.rawValue, lastPart: String(user.longitude)))
        array.append(UserFull(firstPart: Parametrs.activation.rawValue, lastPart: String(user.isActive)))
        array.append(UserFull(firstPart: Parametrs.index.rawValue, lastPart: String(user.index)))
        array.append(UserFull(firstPart: Parametrs.guid.rawValue, lastPart: String(user.guid)))
        array.append(UserFull(firstPart: Parametrs.friends.rawValue, lastPart: recalculateFriend(user: user)))
        array.append(UserFull(firstPart: Parametrs.tag.rawValue, lastPart: recalculateTagr(user: user)))
        return array
    }

    func recalculateFriend(user: User) -> String {
        var stringFriend = ""
        for friend in user.friends {
            stringFriend += "Имя: \(friend.name), id: \(friend.id) \n"
        }
        return stringFriend
    }

    func recalculateTagr(user: User) -> String {
        var stringTag = ""
        for tag in user.tags {
            stringTag += "\(tag), "
        }
        return stringTag
    }
}
