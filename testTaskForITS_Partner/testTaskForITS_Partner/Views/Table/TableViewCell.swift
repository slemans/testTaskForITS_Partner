//
//  TableViewCell.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var icon: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var age: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fetchDataUser(user: User) {
        icon.image = OtherFuncForWorkWithView.otherFuncSingl.getImagesIcon(gender: user.gender)
        name.text = user.name
        age.text = String(user.age) + " лет"
    }
}
