//
//  ViewController.swift
//  testeLocalizacao
//
//  Created by humberto Lima on 08/11/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    
    override func viewDidAppear(_ animated: Bool) {
        localizacaoAtual()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func localizacaoAtual() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        retornaEndereco(localizacaoUsar: locations[0])
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erro na localização")
    }

    func retornaEndereco(localizacaoUsar: CLLocation) {
        let localizacaoCoder = CLGeocoder()
        localizacaoCoder.reverseGeocodeLocation(localizacaoUsar) { (pontos, erro) in
            let pontoTemp = pontos![0]
            print(pontoTemp.administrativeArea ?? "")
            print(pontoTemp.country ?? "")
            print(pontoTemp.name ?? "")
            print(pontoTemp.region ?? "")
            print(pontoTemp.postalCode ?? "")
        }
    }
}

