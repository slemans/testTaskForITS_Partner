//
//  ViewControllerCollection.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 9.01.22.
//

import UIKit

class ViewControllerCollection: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var repeatBt: UIButton!
    @IBOutlet var activitiIndicator: UIActivityIndicatorView!
    @IBOutlet var segmentControlGender: UISegmentedControl!
    @IBOutlet var segmentControlAge: UISegmentedControl!
    @IBOutlet var secondView: UIView!

    var users: [User] = []
    var oldArrayUsers: [User] = []
    var filterUsers: [User] = []
    let otherFuncForProject = OtherFuncForWorkWithView.otherFuncSingl

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
        segmentControlAge.selectedSegmentIndex = 0
        otherFuncForProject.fetchFoundArrayUserForGender(sender.selectedSegmentIndex, oldArrayUsers) { arrayOne, arrayTwo in
            users = arrayOne
            if let arrayTwo = arrayTwo {
                filterUsers = arrayTwo
            }
        }
        collectionView.reloadData()
    }

    @IBAction func segmentedControlAgeCollectionView(_ sender: UISegmentedControl) {
        users = otherFuncForProject.sortedUsersArrayForAge(sender.selectedSegmentIndex, users, oldArrayUsers, filterUsers)
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
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
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

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        performSegue(withIdentifier: "segueFullVc", sender: user)
    }
}

extension ViewControllerCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 2.0
        let padding = 5 * (itemPerRow + 1.0)
        let availableWidth = collectionView.frame.width - padding
        let widthPerItem = availableWidth / itemPerRow
        return CGSize(width: widthPerItem, height: 170)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 13
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return 0
    }
}
