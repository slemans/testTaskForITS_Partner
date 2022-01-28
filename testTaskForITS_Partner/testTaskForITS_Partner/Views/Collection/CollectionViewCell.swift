//
//  CollectionViewCell.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 9.01.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var content: UIView!
    
    func fetchDataUser(user: User){
        imageIcon.image = OtherFuncFor.otherFuncSingl.getImagesIcon(gender: user.gender)
        name.text = user.name
        age.text = String(user.age)
        content.backgroundColor = OtherFuncFor.otherFuncSingl.choseColor(gender: user.gender)
    }
}
