//
//  ViewController.swift
//  CLLocationManager
//
//  Created by 심현석 on 2023/02/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
    }

    func setupLocation() {
        locationManager.delegate = self
        
        // 거리 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 허용받을 alert 알림
        locationManager.requestWhenInUseAuthorization()
        // 위치 사용을 허용하면 현재 위치 정보를 가져옴
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            print("위치 서비스 허용 on")
            guard let lat = locationManager.location?.coordinate.latitude else { return }
            guard let lng = locationManager.location?.coordinate.longitude else { return }
            print(lat, lng)
        }
        else {
            print("위치 서비스 허용 off")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("위치 업데이트!")
            let lat = location.coordinate.latitude
            let lng = location.coordinate.longitude
            print(lat, lng)
        }
    }
}

