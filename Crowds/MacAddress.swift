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
import BCryptSwift

class MacFinder : NSObject, MMLANScannerDelegate{
    
    var lanScanner : MMLANScanner!
    var devices : [MMDevice] = []
    var hashes : [String] = []
    
    func lanScanDidFindNewDevice(_ device: MMDevice!) {
        if device != nil && device.macAddress != nil {
            devices.append(device)
            let salt = BCryptSwift.generateSaltWithNumberOfRounds(12)
            let hashed = BCryptSwift.hashPassword(device.macAddress, withSalt: salt)
            let truncated = String(hashed!.prefix(20))
            hashes.append(truncated)
        }
    }
    
    func lanScanDidFinishScanning(with status: MMLanScannerStatus) {
    }
    
    func lanScanDidFailedToScan() {
    }

    func scan() {
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
