//
//  WorkoutVC.swift
//  LEGDAY
//
//  Created by gdm on 1/7/19.
//  Copyright © 2019 gdm. All rights reserved.
//


//Cannot use Siri without setting App Capability for Siri.
//Cannot do this without paid Apple Dev Account.
//CANNOT RUN APP AS IT WILL CRASH WITHOUT THIS APP CAPABILITY SET
import UIKit
import Intents

class WorkoutVC: UIViewController {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLabel.isHidden = true
        timerLabel.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSiriRequest), name: NSNotification.Name("workoutStartedNotification"), object: nil)
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == INSiriAuthorizationStatus.authorized {
                print("SiriKit: Authorized")
            } else {
                print("SiriKit: Unauthorized")
            }
        }
    }
    
    @objc func handleSiriRequest() {
        guard let intent = DataService.instance.startWorkoutIntent, let goalValue = intent.goalValue, let workoutType = intent.workoutName?.spokenPhrase else {
            timerLabel.isHidden = true
            typeLabel.isHidden = true
            return
        }
        
        typeLabel.isHidden = false
        timerLabel.isHidden = false
        
        typeLabel.text = "TYPE: \(workoutType.capitalized)"
        timerLabel.text = "\(goalValue.convertToClockTime()) LEFT"
    }
}

