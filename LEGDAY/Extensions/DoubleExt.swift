//
//  DoubleExt.swift
//  LEGDAY
//
//  Created by gdm on 1/7/19.
//  Copyright © 2019 gdm. All rights reserved.
//

import Foundation

extension Double {
    func convertToClockTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%0d:%02d", minutes, seconds)
    }
}
