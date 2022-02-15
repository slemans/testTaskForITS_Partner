//
//  Station.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 5.01.22.
//

import MapKit

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
    var subtitle: String? {
        return title
    }
}

class Artworkr: NSObject, MKAnnotation {
    let title: String?
    let age: String?
    let coordinate: CLLocationCoordinate2D

    init(
        title: String?,
        age: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.age = age
        self.coordinate = coordinate
        super.init() // так делать нельзя, почитать
    }

    var subtitle: String? {
        return age
    }
}
