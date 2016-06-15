//
//  SportsWorkout.swift
//  TrackRecord
//
//  Created by Mark Koslow on 6/14/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit

class SportsWorkout: _Workout {
    let sport: Sport
    let color: UIColor = UIFactory.FactoryColors.Green.color
    
    init(duration :Int, date: NSDate, sport: Sport) {
        self.sport = sport
        super.init(duration: duration, date: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let sport = Sport(rawValue: aDecoder.decodeObjectForKey("sport") as? String ?? "") else { return nil }
        self.sport = sport
        super.init(coder: aDecoder)
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)
        aCoder.encodeObject(sport.rawValue, forKey: "sport")
    }
}

enum Sport: String {
    case Basketball, Soccer, Football, Golf
}