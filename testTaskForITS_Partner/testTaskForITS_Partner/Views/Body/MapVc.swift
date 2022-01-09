//
//  MapVc.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 5.01.22.
//
import MapKit
import UIKit

class MapVc: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
//    {
//        didSet {
//                let noLocation = CLLocationCoordinate2D()
//            let viewRegion = MKCoordinateRegion(center: noLocation, latitudinalMeters: 0, longitudinalMeters: 0)
//                self.mapView.setRegion(viewRegion, animated: false)
//            }
//    }

    var nameUser: String!
    var latitude: Double!
    var longitude: Double!
    var users: [User] = []



    override func viewDidLoad() {
        super.viewDidLoad()
        putUser(users: users)
        let initialLocation = CLLocation(latitude: users[0].latitude, longitude: users[0].longitude)
        mapView.centerToLocation(initialLocation)
    }
    
    

    
    
    func putUser(users: [User]) {
        for user in users {
            mapView.addAnnotation(Artwork(title: user.name, coordinate: CLLocationCoordinate2D(latitude: user.latitude, longitude: user.longitude)))
        }
    }

    @IBAction func zoomIn(_ sender: UIButton) {
        let span = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta * 2, longitudeDelta: mapView.region.span.longitudeDelta * 2)
        let region = MKCoordinateRegion(center: mapView.region.center, span: span)
        mapView.setRegion(region, animated: true)
    }

    @IBAction func changeMaptype(_ sender: Any) {
        if mapView.mapType == MKMapType.standard {
            mapView.mapType = MKMapType.satellite
        } else {
            mapView.mapType = MKMapType.standard
        }
    }
    @IBAction func closeVc() {
        dismiss(animated: true)
    }
}




private extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 300) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}


