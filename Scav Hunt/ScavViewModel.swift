//
//  ScavViewModel.swift
//  HW 3
//
//  Created by liam on 11/9/24.
//

import Foundation
import CoreLocation
import CoreMotion
import MapKit

class ScavViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var din: Int = 0
    @Published var halls: [DiningHall] = []
    @Published var state = GameState.loading
    @Published var shaken = false
    @Published var currentLocation: CLLocation?

    override init() {
        super.init()
        loadHalls()
        locationManager.delegate = self
        startShakeDetection()
    }

    func loadHalls() {
        self.halls = [
            DiningHall(text: "1920 Commons", collected: false, coordinate: CLLocation(latitude: 39.95248, longitude: -75.19938)),
            DiningHall(text: "Accenture Café", collected: false, coordinate: CLLocation(latitude: 39.95202, longitude: -75.19135)),
            DiningHall(text: "Falk Kosher Diner", collected: false, coordinate: CLLocation(latitude: 39.95314, longitude: -75.20015)),
            DiningHall(text: "Hill House", collected: false, coordinate: CLLocation(latitude: 39.95300, longitude: -75.19071)),
            DiningHall(text: "Houston Market", collected: false, coordinate: CLLocation(latitude: 39.95091, longitude: -75.19388)),
            DiningHall(text: "Joe's Café", collected: false, coordinate: CLLocation(latitude: 39.95156, longitude: -75.19652)),
            DiningHall(text: "Kings Court English House", collected: false, coordinate: CLLocation(latitude: 39.95416, longitude: -75.19418)),
            DiningHall(text: "Lauder House", collected: false, coordinate: CLLocation(latitude: 39.95382, longitude: -75.19108)),
            DiningHall(text: "McClelland Express", collected: false, coordinate: CLLocation(latitude: 39.95107, longitude: -75.19839)),
            DiningHall(text: "Pret a Manager", collected: false, coordinate: CLLocation(latitude: 39.95263, longitude: -75.19848)),
            DiningHall(text: "Quaker Kitchen", collected: false, coordinate: CLLocation(latitude: 39.95354, longitude: -75.20198)),
        ]
    }
    
    let locationManager = CLLocationManager()
    let motionManager = CMMotionManager()
    let feedbackGenerator = UINotificationFeedbackGenerator()
    
    var isRequestingLocation: Bool = false
    
    func loadGame() {
        state = .loading
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            reqLocation()
        case .denied, .restricted:
            state = .error
        default:
            break
        }
    }
    
    func reqLocation() {
        if !isRequestingLocation {
            isRequestingLocation = true
            locationManager.startUpdatingLocation()
        }
    }
    
    func checkProximityToDiningHall() -> Bool {
        guard let currentLocation = currentLocation else { return false }
        let targetLocation = halls[din].coordinate
            
        if currentLocation.distance(from: targetLocation) <= 50 {
                return true
        }
        return false
    }
    
    func startShakeDetection() {
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { [weak self] data, error in
            guard let data = data else { return }
            if abs(data.acceleration.x) > 2.5 || abs(data.acceleration.y) > 2.5 || abs(data.acceleration.z) > 2.5 {
                self?.shaken = true
                self?.reqLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
        isRequestingLocation = false
    }
}
