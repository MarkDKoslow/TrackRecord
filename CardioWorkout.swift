//
//  CardioWorkout.swift
//  TrackRecord
//
//  Created by Mark Koslow on 6/14/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit

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