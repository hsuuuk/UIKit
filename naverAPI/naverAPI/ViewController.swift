//
//  ViewController.swift
//  naverAPI
//
//  Created by 심현석 on 2023/02/10.
//

import UIKit
import NMapsMap
import CoreLocation
import SnapKit
import UserNotifications

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var dataManager = DataManager.shared
    
    var markers = [NMFMarker]()
    
    private let mapView: NMFMapView = {
        let mapView = NMFMapView() // 지도 객체 생성
        mapView.positionMode = .direction // 현 위치 표시
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setupCurrentlocation()
        addMarkers(mapView: mapView)
        setupPushNotification()
    }
    
    func setupMap() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalTo(view.safeAreaLayoutGuide)
        }
        
        let locationButton = UIButton(frame: CGRect(x: 11, y: 722, width: 50, height: 50))
        locationButton.backgroundColor = UIColor.white
        locationButton.layer.cornerRadius = 25
        locationButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
        locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        view.addSubview(locationButton)
    }
    
    @objc func locationButtonTapped() {
        guard let latitude = locationManager.location?.coordinate.latitude else { return }
        guard let longitude = locationManager.location?.coordinate.longitude else { return }
        
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude, lng: longitude))
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
    }
    
    func setupCurrentlocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 거리 정확도
        locationManager.requestWhenInUseAuthorization() // // 위치 허용받을 alert 알림
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치서비스 On")
            locationManager.startUpdatingLocation()
            
            //현 위치로 카메라 이동
            guard let latitude = locationManager.location?.coordinate.latitude else { return }
            guard let longitude = locationManager.location?.coordinate.longitude else { return }
            //let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude, lng: longitude))
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.496486063, lng: 127.028361548))
            cameraUpdate.animation = .easeIn
            mapView.moveCamera(cameraUpdate)
        } else {
            print("위치서비스 Off")
        }
    }
    
    func addMarkers(mapView: NMFMapView) {
        dataManager.Request {
            let locations = self.dataManager.locationList
            locations.forEach { coordinate in
                let lat = coordinate.0
                let lng = coordinate.1
                let location = NMGLatLng(lat: lat, lng: lng)
                
                DispatchQueue.main.async {
                    let marker = NMFMarker()
                    marker.position = location
                    marker.height = 32
                    marker.width = 25
                    marker.mapView = mapView
                    
                    marker.touchHandler =  { (overlay: NMFOverlay) -> Bool in
                        let controller = ContentsController()
                        controller.modalPresentationStyle = .automatic
                        self.present(controller, animated: true)
                        return true
                    }
                    
                    self.markers.append(marker)
                }
            }
        }
    }
    
    func setupPushNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("알림 권한 허용")
            } else {
                print("알림 권한 거부")
            }
        }
    }
}

extension ViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        markers.forEach { maker in
            let markerLocation = CLLocation(latitude: maker.position.lat, longitude: maker.position.lng)
            let distance = currentLocation.distance(from: markerLocation)
            
            if distance <= 100 {
                print("충전소의 100m 이하 거리에 도달했습니다.")
                // 알림 발생
                let content = UNMutableNotificationContent()
                content.title = "알림"
                content.body = "충전소의 100m 이하 거리에 도달했습니다."
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
                
                let request = UNNotificationRequest(identifier: "testNotification", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
        }
    }
}

