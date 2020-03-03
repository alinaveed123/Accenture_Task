//
//  ViewController.swift
//  WeatherLogger
//
//  Created by ALI NAVEED on 02/03/2020.
//  Copyright © 2020 Personal   Ltd. All rights reserved.
//

import UIKit
import CoreLocation
import NVActivityIndicatorView
import RealmSwift
import ViewAnimator

class ViewController: UIViewController {
    let CurrentCell = "CurrentCell"
    let HistoryCell = "HistoryCell"
    var arrayOfWeather = DBManager.getWeatherModel()

    let locationManager = CLLocationManager()
    var coordinates: CLLocationCoordinate2D? {
        didSet {
            if let coordinates = coordinates {
                let lat = String(coordinates.latitude)
                let lon = String(coordinates.longitude)
                
                fetchWeather(lon: lon, lat: lat)
            }
        }
    }
    
    var result: Result? {
        didSet {
            if let _ = result {
                tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.requestWhenInUseAuthorization()
        
        switch(CLLocationManager.authorizationStatus()) {
        case .restricted, .notDetermined:
            fetchLocation()
        case .denied:
            showPermissionErrorAlert()
        case .authorizedAlways, .authorizedWhenInUse:
            fetchLocation()
        @unknown default:
            fatalError()
        }
    }
    
    func showPermissionErrorAlert() {
        let alert = UIAlertController(title: "Location Permissions", message: "Please enable location services and give location permissions to see current weather. You can enable it in the Settings App.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func fetchLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        else {
            showPermissionErrorAlert()
        }
    }
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        
        if let result = self.result {
            let myWeather2 = Weather()
            myWeather2.temp = String(result.main.temp)
            myWeather2.dates = Date().format()
            myWeather2.icon = result.weather.icon
            myWeather2.name = result.name
            myWeather2.humidity = String(result.main.humidity)
            DBManager.persistWeatherModel(realmObject: myWeather2)
        }
        arrayOfWeather = DBManager.getWeatherModel()
        tableView.reloadData()
        
         let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
         let zoomAnimation = AnimationType.zoom(scale: 0.2)
         UIView.animate(views: tableView.visibleCells,
                        animations: [fromAnimation, zoomAnimation],
                        delay: 0.5)
    }
    
    func fetchWeather(lon: String, lat: String) {
        DispatchQueue.main.async {
            APIClient.getWeather(with: lat, lon: lon) { (result, error) in
                self.result = result
            }
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.coordinates = locValue
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : self.arrayOfWeather?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.section == 0 {
            
            let currentCell = tableView.dequeueReusableCell(withIdentifier: CurrentCell) as! CurrentWeatherCell
            currentCell.model = self.result
            cell = currentCell
        }
        else {
            let currentCell  = tableView.dequeueReusableCell(withIdentifier: HistoryCell) as! HistoryWeatherCell
            currentCell.model = self.arrayOfWeather?[indexPath.row]
            cell = currentCell
            
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Current" : "History"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let trans = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

        if indexPath.section == 0 {
          let CurrentWeather = Weather()

            if(self.result == nil) { return }
            
            if let result = self.result {
                       CurrentWeather.temp = String(result.main.temp)
                       CurrentWeather.dates = Date().format()
                       CurrentWeather.icon = result.weather.icon
                       CurrentWeather.name = result.name
                       CurrentWeather.humidity = String(result.main.humidity)
                        CurrentWeather.descriptions = String(result.weather.description)
                   }
            
            trans.WeatherDetail = CurrentWeather

        }else{
            trans.WeatherDetail = self.arrayOfWeather?[indexPath.row]
        }
        navigationController?.pushViewController(trans, animated: true)

    }
}
