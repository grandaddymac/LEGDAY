//
//  IntentHandler.swift
//  IntentHandler
//
//  Created by gdm on 1/7/19.
//  Copyright © 2019 gdm. All rights reserved.
//

import Intents



class IntentHandler: INExtension, INStartWorkoutIntentHandling {
    func handle(intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        print("Start workout intent: ", intent)
        
        var userActivity: NSUserActivity? = nil
        
        guard let spokenPhrase = intent.workoutName?.spokenPhrase else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: userActivity))
            return
        }
        
        if spokenPhrase == "walk" || spokenPhrase == "run" {
            completion(INStartWorkoutIntentResponse(code: .handleInApp, userActivity: userActivity))
        } else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: nil))
        }
    }
}
