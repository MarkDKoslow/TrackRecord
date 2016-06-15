//
//  ClassWorkout.swift
//  TrackRecord
//
//  Created by Mark Koslow on 6/14/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit

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
