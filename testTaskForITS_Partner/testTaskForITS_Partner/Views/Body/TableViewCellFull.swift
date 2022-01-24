//
//  TableViewCellFull.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 4.01.22.
//

import UIKit

class TableViewCellFull: UITableViewCell {

    @IBOutlet weak var infoPart: UILabel!
    @IBOutlet weak var userInform: UILabel!
    var imageUrl: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fetchDataUserFull(userFull: UserFull){
        infoPart.text = userFull.firstPart
        userInform.text = userFull.lastPart
    }
}
