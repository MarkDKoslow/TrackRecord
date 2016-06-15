//
//  LiftWorkout.swift
//  TrackRecord
//
//  Created by Mark Koslow on 6/14/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit

class LiftWorkout: _Workout {
    let muscleGroups: [MuscleGroup]
    let color: UIColor = UIFactory.FactoryColors.Orange.color
    
    init(duration: Minutes, date: NSDate, muscleGroups: [MuscleGroup]) {
        self.muscleGroups = muscleGroups
        super.init(duration: duration, date: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let muscleGroupsRawValues = aDecoder.decodeObjectForKey("muscle_groups") as? [String] {  // TO DO: More elegant implementation
            self.muscleGroups = muscleGroupsRawValues.map { MuscleGroup(rawValue: $0) ?? .Arms }
            super.init(coder: aDecoder)
            return
        }
        
        return nil
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)
        let muscleGroupsRawValues = muscleGroups.map { $0.rawValue }
        aCoder.encodeObject(muscleGroupsRawValues, forKey: "muscle_groups")
    }
}

enum MuscleGroup: String {
    case Abs, Arms, Back, Chest, Legs, Shoulders
}