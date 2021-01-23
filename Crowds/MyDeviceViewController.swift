//
//  MyDeviceViewController.swift
//  Crowds
//
//  Created by Jiahua Chen on 1/23/21.
//

import UIKit

class MyDeviceViewController: UIViewController {

    @IBOutlet weak var myPhoneCard: UIView!
    @IBOutlet weak var isContributingLabel: UILabel!
    @IBOutlet weak var toggleSharingButton: UIButton!
    
    @IBOutlet weak var sharingInfoView: UIView!
    
    var isContributing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The subview inside the collection view cell
        myPhoneCard.layer.cornerRadius = 16.0
        
        sharingInfoView.layer.cornerRadius = 16.0
        sharingInfoView.clipsToBounds = true
        
        toggleSharingButton.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toggleSharing(_ sender: UIButton) {
        if isContributing {
            toggleSharingButton.titleLabel!.text = "Stop Sharing"
            isContributingLabel.text = "Currently Contributing"
            myPhoneCard.backgroundColor = UIColor.systemIndigo
        } else {
            toggleSharingButton.titleLabel!.text = "Start Sharing"
            isContributingLabel.text = "You're Not Contributing"
            myPhoneCard.backgroundColor = UIColor.darkGray
        }
        isContributing = !isContributing
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
