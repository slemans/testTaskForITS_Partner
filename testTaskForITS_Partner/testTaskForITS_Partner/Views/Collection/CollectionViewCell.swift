//
//  CollectionViewCell.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 9.01.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageIcon: UIImageView!
    @IBOutlet var age: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var content: UIView!
    let otherFuncForProject = OtherFuncForWorkWithView()

    func fetchDataUser(user: User) {
        imageIcon.image = otherFuncForProject.getImagesIcon(gender: user.gender)
        name.text = user.name
        age.text = String(user.age)
        content.backgroundColor = otherFuncForProject.choseColor(gender: user.gender)
    }
}
