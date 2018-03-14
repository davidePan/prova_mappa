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
    @IBOutlet weak var mappa: MKMapView!
    let locationManag = LocationManager.shared
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200)
        mappa.setRegion(coordinateRegion, animated: true)
        var location = userLocation
        print(location.coordinate)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       mappa.delegate = self
        mappa.mapType = MKMapType.hybrid
        mappa.showsUserLocation = true
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

