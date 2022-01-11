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

    var nameUser: String!
    var latitude: Double!
    var longitude: Double!
    var users: [User] = []
    var numberChoseUser = 0



    override func viewDidLoad() {
        super.viewDidLoad()
        putUser(users: users)
        llocationUser(number: 0)
    }

    @IBAction func beforeUser() {
        if numberChoseUser == 0 {
            numberChoseUser = users.count - 1
            llocationUser(number: numberChoseUser)
        } else {
            numberChoseUser -= 1
            llocationUser(number: numberChoseUser)
        }

    }

    @IBAction func afterUser() {
        if numberChoseUser == users.count - 1 {
            numberChoseUser = 0
            llocationUser(number: numberChoseUser)
        } else {
            numberChoseUser += 1
            llocationUser(number: numberChoseUser)
        }
    }

    private func llocationUser(number: Int) {
        let initialLocation = CLLocation(latitude: users[number].latitude, longitude: users[number].longitude)
        mapView.centerToLocation(initialLocation)
    }


    private func putUser(users: [User]) {
        for user in users {
            mapView.addAnnotation(Artwork(title: user.name, coordinate: CLLocationCoordinate2D(latitude: user.latitude, longitude: user.longitude)))
        }
    }

    @IBAction func zoomIn(_ sender: UIButton) {
        mapView.setZoomByDelta(delta: 0.5, animated: true)
    }
    @IBAction func zoomOut() {
        if mapView.zoomLevel > 4 {
            mapView.setZoomByDelta(delta: 2, animated: true)
        }
    }

    @IBAction func changeMaptype(_ sender: Any) {
        if mapView.mapType == MKMapType.standard {
            mapView.mapType = MKMapType.satellite
        } else {
            mapView.mapType = MKMapType.standard
        }
    }

}

extension MKMapView {
    func setZoomByDelta(delta: Double, animated: Bool) {
        var _region = region;
        var _span = region.span;
        _span.latitudeDelta *= delta;
        _span.longitudeDelta *= delta;
        _region.span = _span;

        setRegion(_region, animated: animated)
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

extension MKMapView {
    var zoomLevel: Double {
        get {
            return log2(360 * (Double(self.frame.size.width / 256) / self.region.span.longitudeDelta)) + 1
        }

        set (newZoomLevel) {
            setCenterCoordinate(coordinate: self.centerCoordinate, zoomLevel: newZoomLevel, animated: false)
        }
    }

    private func setCenterCoordinate(coordinate: CLLocationCoordinate2D, zoomLevel: Double, animated: Bool) {
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 360 / pow(2, zoomLevel) * Double(self.frame.size.width) / 256)
        setRegion(MKCoordinateRegion(center: coordinate, span: span), animated: animated)
    }
}

