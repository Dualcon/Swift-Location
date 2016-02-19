//
//  ViewController.swift
//  get-my-location
//
//  Created by Daniel Vieira on 20/11/14.
//  Copyright (c) 2014 Daniel Vieira. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var label1: UILabel!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestWhenInUseAuthorization()
        } else {
            println("Your definitions are disable")
        }
    }

    
    @IBAction func button1(sender: AnyObject) {
        label1.text = "Muda"
    }˙
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
locationManager.stopUpdatingLocation()
        println("Serviço desligado")
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var locationArray = locations as NSArray
        var lastLocation = locationArray.lastObject as CLLocation
    var coordenada = lastLocation.coordinate
        
        println("Localização com altitude: \(coordenada.latitude) logintude: \(coordenada.longitude)")
        label1.text = "Works"
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.AuthorizedWhenInUse || status == CLAuthorizationStatus.Authorized) {
            locationManager.startUpdatingLocation()
        }
    }
    
}

