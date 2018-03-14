//
//  ViewController.swift
//  map
//
//  Created by Davide Panettieri on 08/03/18.
//  Copyright © 2018 Davide Panettieri. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
///



class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var indirizzoLabel: UILabel!
    @IBOutlet weak var mappa: MKMapView!
    let locationManag = LocationManager.shared
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200)
        mappa.setRegion(coordinateRegion, animated: true)
        let location = userLocation

        print(location.coordinate)
        
       
       

    

    }
    override func viewDidLoad() {
        super.viewDidLoad()
       mappa.delegate = self
        mappa.mapType = MKMapType.hybrid
        mappa.showsUserLocation = true
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(locationManag.location!) { (placemarks, error) in
            
            self.handlerIndirizzo(withPlacemarks: placemarks, error: error)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func handlerIndirizzo(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {

        if let error = error {
            
            indirizzoLabel.text = "Indirizzo non disponibile"
            
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                indirizzoLabel.text = "\(placemark.locality!), \(placemark.country!)"
            } else {
                indirizzoLabel.text = "Indirizzo non disponibile "
            }
        }
    }
    

}

