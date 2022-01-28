//
//  ViewControllerCollection.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 9.01.22.
//

import UIKit

class ViewControllerCollection: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var repeatBt: UIButton!
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
            ViewControllerFullInfoVC.userFullInformation = sender as? User
        } else if let segueMapVc = segue.destination as? MapVc {
            segueMapVc.users = users
        }
    }

    private func getUrlSession() {
        ServiseAPI.apiSingl.fetchUrlSession { [weak self] users in
            self?.oldArrayUsers = users
            self?.users = users
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                self?.activitiIndicator.stopAnimating()
                self?.secondView.alpha = 0
            }
        }
    }

    @IBAction func segmentedControlGramedAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            segmentControlAge.selectedSegmentIndex = 0
            users.removeAll()
            OtherFuncFor.otherFuncSingl.seachGenderUsers(gender: .male, oldArrayUsers: oldArrayUsers) { arrayOne, arrayTwo in
                users = arrayOne
                filterUsers = arrayTwo
            }
            collectionView.reloadData()
        case 2:
            segmentControlAge.selectedSegmentIndex = 0
            users.removeAll()
            OtherFuncFor.otherFuncSingl.seachGenderUsers(gender: .female, oldArrayUsers: oldArrayUsers) { arrayOne, arrayTwo in
                users = arrayOne
                filterUsers = arrayTwo
            }
            collectionView.reloadData()
        default:
            segmentControlAge.selectedSegmentIndex = 0
            users = oldArrayUsers
            collectionView.reloadData()
        }
    }

    @IBAction func segmentedControlAgeCollectionView(_ sender: UISegmentedControl) {
        users = OtherFuncFor.otherFuncSingl.sortedUsersArrayForAge(sender.selectedSegmentIndex, users, oldArrayUsers, filterUsers)
        collectionView.reloadData()
    }

    @IBAction func repiatBtAct() {
        users.removeAll()
        segmentControlGender.selectedSegmentIndex = 0
        segmentControlAge.selectedSegmentIndex = 0
        collectionView.reloadData()
        getUrlSession()
    }

}


extension ViewControllerCollection: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollection", for: indexPath) as! CollectionViewCell
        let user = users[indexPath.row]
        cell.fetchDataUser(user: user)
        cell.content.layer.cornerRadius = 10
        cell.content.layer.masksToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        performSegue(withIdentifier: "segueFullVc", sender: user)
    }
}

extension ViewControllerCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 2.0
        let padding = 5 * (itemPerRow + 1.0)
        let availableWidth = collectionView.frame.width - padding
        let widthPerItem = availableWidth / itemPerRow
        return CGSize(width: widthPerItem, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
