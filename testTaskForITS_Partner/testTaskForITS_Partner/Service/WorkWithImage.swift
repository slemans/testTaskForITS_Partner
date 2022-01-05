//
//  WorkWithImage.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 5.01.22.
//

import UIKit

class WorkWithImage{
    
    func getImagesIcon(gender: String) -> UIImage{
        if gender == "male"{
            return #imageLiteral(resourceName: "male")
        } else {
            return #imageLiteral(resourceName: "iconFamale")
        }
    }
}
