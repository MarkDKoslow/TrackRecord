//
//  Workout.swift
//  TrackRecord
//
//  Created by Mark Koslow on 6/1/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit
import Realm

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

// Cardio Workout
//
class CardioWorkout: _Workout {
    typealias Miles = Double
    
    let distance: Miles
    let cardioType: CardioExercise
    let color: UIColor = UIFactory.FactoryColors.Red.color
    
    init(duration: Int, date: NSDate, distance: Miles, exercise: CardioExercise) {
        self.distance = distance
        self.cardioType = exercise
        super.init(duration: duration, date: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let distance = aDecoder.decodeObjectForKey("distance") as? Double,
            let cardioType = CardioExercise(rawValue: aDecoder.decodeObjectForKey("cardio_type") as? String ?? "") // TO DO: more elegant solution here
            else { return nil }
        
        self.distance = distance
        self.cardioType = cardioType
        super.init(coder: aDecoder)
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)
        aCoder.encodeDouble(distance, forKey: "distance")
        aCoder.encodeObject(cardioType.rawValue, forKey: "cardio_type")
    }
}

enum CardioExercise: String {
    case Boxing, Cycling, Running, Spinning
}

// Lift Workout
//
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

// Class Workout
//
class ClassWorkout: _Workout {
    let classTitle: ClassWorkoutOptions
    let color: UIColor = UIFactory.FactoryColors.DeepBlue.color
    
    init(duration: Int, date: NSDate, classTitle: ClassWorkoutOptions) {
        self.classTitle = classTitle
        super.init(duration: duration, date: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let classTitle = ClassWorkoutOptions(rawValue: aDecoder.decodeObjectForKey("class_title") as? String ?? "") else { return nil }
        self.classTitle = classTitle
        super.init(coder: aDecoder)
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)
        aCoder.encodeObject(classTitle.rawValue, forKey: "class_title")
    }
}

enum ClassWorkoutOptions: String {
    case Barre, Crossfit, Dance, MartialArts, Pilates, Yoga
}

// Sports
//
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