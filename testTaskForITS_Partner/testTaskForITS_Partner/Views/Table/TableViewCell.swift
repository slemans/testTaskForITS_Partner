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
    var serviseAPI = WorkWithImage()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fetchDataUser(user: User){
        icon.image = serviseAPI.getImagesIcon(gender: user.gender)
        name.text = user.name
        age.text = String(user.age) + " лет"
    }


}
