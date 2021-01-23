//
//  MacAddress.swift
//  Crowds
//
//  Created by Gareth Mansfield on 1/23/21.
//

import Foundation
//
//  MyDeviceViewController.swift
//  Crowds
//
//  Created by Jiahua Chen on 1/23/21.
//

import UIKit
import MMLanScan

class MacFinder : NSObject, MMLANScannerDelegate{
    
    var lanScanner : MMLANScanner!
    var devices : [MMDevice] = []
    
    func lanScanDidFindNewDevice(_ device: MMDevice!) {
        print(device.macAddress ?? "NA")
        print(device.brand ?? "NA")
        if device != nil {
            devices.append(device)
        }
    }
    
    func lanScanDidFinishScanning(with status: MMLanScannerStatus) {
        print()
    }
    
    func lanScanDidFailedToScan() {
        print()
    }

    func setup() {
        self.lanScanner = MMLANScanner(delegate: self)
        self.lanScanner.start()
        self.lanScanner.stop()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
