//
//  _Workout.swift
//  TrackRecord
//
//  Created by Mark Koslow on 6/1/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import Foundation

// Abstract Workout Superclass
//
class _Workout: NSObject, NSCoding {
    typealias Minutes = Int
    let duration: Minutes
    let date: NSDate
    
    init(duration: Int, date: NSDate) {
        self.duration = duration
        self.date = date
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let date = aDecoder.decodeObjectForKey("date") as? NSDate
            else { return nil }
        
        self.duration = aDecoder.decodeIntegerForKey("duration")
        self.date = date
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInt(Int32(self.duration), forKey: "duration")
        aCoder.encodeObject(date, forKey: "date")
    }
}