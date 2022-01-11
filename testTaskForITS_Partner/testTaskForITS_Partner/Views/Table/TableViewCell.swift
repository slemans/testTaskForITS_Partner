//
//  TableViewCell.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    
    var user: User!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fetchDataUser(user: User){
        icon.image = OtherFuncFor.otherFuncSingl.getImagesIcon(gender: user.gender)
        name.text = user.name
        age.text = String(user.age) + " лет"
    }


}
