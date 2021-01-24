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
    @IBOutlet weak var serverSeesCard: UIView!
    @IBOutlet weak var phoneSeesCard: UIView!
    
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var vagueLocationLabel: UILabel!
    @IBOutlet weak var preciseLocationLabel: UILabel!
    @IBOutlet weak var macAddressLabel: UILabel!
    @IBOutlet weak var anonymousIdentifierLabel: UILabel!
    @IBOutlet weak var otherAnonymousLabelOne: UILabel!
    @IBOutlet weak var otherAnonymousLabelTwo: UILabel!
    @IBOutlet weak var otherAnonymousLabelThree: UILabel!
    @IBOutlet weak var crowdednessLabel: UILabel!
    @IBOutlet weak var devicesNearYouLabel: UILabel!
    
    @IBOutlet weak var precisionTagLabel: UILabel!
    
    var blurredEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    var isContributing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The subview inside the collection view cell
        myPhoneCard.layer.cornerRadius = 16.0
        
        sharingInfoView.layer.cornerRadius = 16.0
        sharingInfoView.clipsToBounds = true
        
        toggleSharingButton.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
        
        blurredEffectView.frame = sharingInfoView.bounds
        sharingInfoView.addSubview(blurredEffectView)
        blurredEffectView.isHidden = true
        
        stoppedSharing()
        
    }

    
    func updateData() {
        vagueLocationLabel.isHidden = true
        preciseLocationLabel.isHidden = true
        precisionTagLabel.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            // Put your code which should be executed with a delay here
            self.vagueLocationLabel.isHidden = false
            self.preciseLocationLabel.isHidden = false
            self.precisionTagLabel.isHidden = false
        }
        
        macAddressLabel.isHidden = true
        anonymousIdentifierLabel.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Put your code which should be executed with a delay here
            self.macAddressLabel.isHidden = false
            self.anonymousIdentifierLabel.isHidden = false
        }
        
        locationNameLabel.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            // Put your code which should be executed with a delay here
            self.locationNameLabel.isHidden = false
        }
        
        otherAnonymousLabelOne.isHidden = true
        otherAnonymousLabelTwo.isHidden = true
        otherAnonymousLabelThree.isHidden = true
        crowdednessLabel.text = "None"
        devicesNearYouLabel.text = "0"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            // Put your code which should be executed with a delay here
            self.otherAnonymousLabelOne.isHidden = false
            self.crowdednessLabel.text = "Low"
            self.devicesNearYouLabel.text = "1"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Put your code which should be executed with a delay here
            self.otherAnonymousLabelTwo.isHidden = false
            self.crowdednessLabel.text = "Low"
            self.devicesNearYouLabel.text = "2"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            // Put your code which should be executed with a delay here
            self.otherAnonymousLabelThree.isHidden = false
            self.crowdednessLabel.text = "Slight/Low"
            self.devicesNearYouLabel.text = "3"
        }
        
    }
    
    @IBAction func toggleSharing(_ sender: UIButton) {
        if isContributing {
            stoppedSharing()
        } else {
            startedSharing()
        }
        isContributing = !isContributing
    }
    
    func startedSharing() {
        updateData()
        toggleSharingButton.setTitle("Stop Sharing", for: .normal)
        isContributingLabel.text = "Currently Contributing"
        myPhoneCard.backgroundColor = UIColor.systemIndigo
        serverSeesCard.backgroundColor = UIColor.systemPurple
        phoneSeesCard.backgroundColor = UIColor.systemGreen
        UIView.animate(withDuration: 0.5, animations: {
            self.blurredEffectView.isHidden = true
        })
    }
    
    func stoppedSharing() {
        toggleSharingButton.setTitle("Start Sharing", for: .normal)
        isContributingLabel.text = "You're Not Contributing"
        myPhoneCard.backgroundColor = UIColor.darkGray
        serverSeesCard.backgroundColor = UIColor.darkGray
        phoneSeesCard.backgroundColor = UIColor.darkGray
        UIView.animate(withDuration: 0.5, animations: {
            self.blurredEffectView.isHidden = false
        })
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

import UIKit

@IBDesignable
class SpinnerView : UIView {

    override var layer: CAShapeLayer {
        get {
            return super.layer as! CAShapeLayer
        }
    }

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.fillColor = nil
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 3
        setPath()
    }

    override func didMoveToWindow() {
        animate()
    }

    private func setPath() {
        layer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: layer.lineWidth / 2, dy: layer.lineWidth / 2)).cgPath
    }

    struct Pose {
        let secondsSincePriorPose: CFTimeInterval
        let start: CGFloat
        let length: CGFloat
        init(_ secondsSincePriorPose: CFTimeInterval, _ start: CGFloat, _ length: CGFloat) {
            self.secondsSincePriorPose = secondsSincePriorPose
            self.start = start
            self.length = length
        }
    }

    class var poses: [Pose] {
        get {
            return [
                Pose(0.0, 0.000, 0.7),
                Pose(0.6, 0.500, 0.5),
                Pose(0.6, 1.000, 0.3),
                Pose(0.6, 1.500, 0.1),
                Pose(0.2, 1.875, 0.1),
                Pose(0.2, 2.250, 0.3),
                Pose(0.2, 2.625, 0.5),
                Pose(0.2, 3.000, 0.7),
            ]
        }
    }

    func animate() {
        var time: CFTimeInterval = 0
        var times = [CFTimeInterval]()
        var start: CGFloat = 0
        var rotations = [CGFloat]()
        var strokeEnds = [CGFloat]()

        let poses = type(of: self).poses
        let totalSeconds = poses.reduce(0) { $0 + $1.secondsSincePriorPose }

        for pose in poses {
            time += pose.secondsSincePriorPose
            times.append(time / totalSeconds)
            start = pose.start
            rotations.append(start * 2 * .pi)
            strokeEnds.append(pose.length)
        }

        times.append(times.last!)
        rotations.append(rotations[0])
        strokeEnds.append(strokeEnds[0])

        animateKeyPath(keyPath: "strokeEnd", duration: totalSeconds, times: times, values: strokeEnds)
        animateKeyPath(keyPath: "transform.rotation", duration: totalSeconds, times: times, values: rotations)

        animateStrokeHueWithDuration(duration: totalSeconds * 5)
    }

    func animateKeyPath(keyPath: String, duration: CFTimeInterval, times: [CFTimeInterval], values: [CGFloat]) {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.keyTimes = times as [NSNumber]?
        animation.values = values
        animation.calculationMode = .linear
        animation.duration = duration
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: animation.keyPath)
    }

    func animateStrokeHueWithDuration(duration: CFTimeInterval) {
        let count = 36
        let animation = CAKeyframeAnimation(keyPath: "strokeColor")
        animation.keyTimes = (0 ... count).map { NSNumber(value: CFTimeInterval($0) / CFTimeInterval(count)) }
        animation.values = (0 ... count).map {
            if true {
                return UIColor.white.cgColor
            } else {
                return UIColor(hue: CGFloat($0) / CGFloat(count), saturation: 1, brightness: 1, alpha: 1).cgColor
            }
        }
        animation.duration = duration
        animation.calculationMode = .linear
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: animation.keyPath)
    }

}
