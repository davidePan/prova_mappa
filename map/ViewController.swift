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

private let locationManager = LocationManager.shared


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mappa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       mappa.delegate = self
        mappa.mapType = MKMapType.satellite
        mappa.showsUserLocation = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
