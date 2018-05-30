//
//  ViewController.swift
//  swiftTest7
//
//  Created by 李俊成 on 2018/5/14.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController ,CLLocationManagerDelegate{
    var locationlabel = UILabel()
    var locationBtn = UIButton()
    
    
    var locationManger : CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI ()
    }
    func setUpUI () {
        locationlabel.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        locationlabel.numberOfLines = 0
        view.addSubview(locationlabel)
        locationBtn.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
        view.addSubview(locationBtn)
        locationBtn.backgroundColor = UIColor.red
        locationlabel.textColor = UIColor.red
        locationBtn.addTarget(self, action:#selector(myLocationBtnDidTouch) , for: .touchUpInside)
    }
    @objc func myLocationBtnDidTouch(_ sender:AnyObject) {
        locationManger = CLLocationManager()
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
    }
    //
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationlabel.text = "Error while updating location " + error.localizedDescription
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                self.locationlabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0] // 定位成功
                self.displayLocationInfo(pm)
            } else {
                self.locationlabel.text = "Problem with the data received from geocoder"
            }
        })
    }
    //
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let contaionsPlacemark = placemark {
            locationManger.stopUpdatingLocation()
            let locality = (contaionsPlacemark.locality != nil) ? contaionsPlacemark.locality : ""
            let postalCode = (contaionsPlacemark.postalCode != nil) ? contaionsPlacemark.postalCode : ""
            let administrativeArea = (contaionsPlacemark.administrativeArea != nil) ? contaionsPlacemark.administrativeArea : ""
            let country = (contaionsPlacemark.country != nil) ? contaionsPlacemark.country : ""
            self.locationlabel.text = postalCode! + "" + locality!

            self.locationlabel.text?.append("\n" + administrativeArea! + "," + country!)
            
            
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






























