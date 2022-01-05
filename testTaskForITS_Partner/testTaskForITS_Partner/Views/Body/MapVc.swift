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
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let annotations = getMapAnnotations()
        mapView.addAnnotations(annotations)
        let initialLocationUser = CLLocation(latitude: latitude, longitude: longitude)

//        let lan = CLLocationDegrees
//        let ff = CLLocation(latitude: CLLocationDegrees, longitude: <#T##CLLocationDegrees#>)
        let initialLocation = CLLocation(latitude: 53.850344553988194, longitude: 27.538481176606346)
        print(initialLocation)
        mapView.centerToLocation(initialLocation)

        var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        
        for annotation in annotations {
            points.append(annotation.coordinate)
        }
        
        
        let polyline = MKPolyline(coordinates: &points, count: points.count)
        
        mapView.addOverlay(polyline)
        
//        mapView.addAnnotation(artwork)
        
        
    }
    
    func getMapAnnotations() -> [Station] {
        var annotations:Array = [Station]()
        
        //load plist file
        
        var stations: NSArray?
        if let path = Bundle.main.path(forResource: "stations", ofType: "plist") {
            stations = NSArray(contentsOfFile: path)
        }
        if let items = stations {
            for item in items {
                let lat = (item as AnyObject).value(forKey: "lat") as! Double
                let long = (item as AnyObject).value(forKey: "long")as! Double
                let annotation = Station(latitude: lat, longitude: long)
                annotation.title = (item as AnyObject).value(forKey: "title") as? String
                annotations.append(annotation)
            }
        }
        
        return annotations
    }
    
    @IBAction func zoomIn(_ sender: UIButton) {
        let location = CLLocationCoordinate2D(latitude: 53.850344553988194, longitude: 27.538481176606346)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 2000.0, longitudinalMeters: 2000.0)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func changeMaptype(_ sender: Any) {
        if mapView.mapType == MKMapType.standard{
            mapView.mapType = MKMapType.satellite
        } else {
            mapView.mapType = MKMapType.standard
        }
    }
    
    
    
    @IBAction func closeVc() {
        dismiss(animated: true)
    }
    

}
extension MapVc: MKMapViewDelegate{
    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 300
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
