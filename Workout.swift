//
//  Workout.swift
//  TrackRecord
//
//  Created by Mark Koslow on 6/1/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit

// Workout Protocol
//
class _Workout {
    let duration: Int
    
    init(duration: Int) {
        self.duration = duration
    }
}

// Cardio Workout
//
class CardioWorkout: _Workout {
    typealias Miles = Int
    
    let distance: Miles
    let exercise: CardioExercise
    let color: UIColor = .redColor()
    
    init(duration: Int, distance: Miles, exercise: CardioExercise) {
        self.distance = distance
        self.exercise = exercise
        super.init(duration: duration)
    }
}

enum CardioExercise {
    case Boxing, Cycling, Running, Spinning
}

// Lift Workout
//
class LiftWorkout: _Workout {
    let muscleGroups: [MuscleGroup]
    let color: UIColor = .orangeColor()
    
    init(duration: Int, muscleGroups: [MuscleGroup]) {
        self.muscleGroups = muscleGroups
        super.init(duration: duration)
    }
}

enum MuscleGroup {
    case Abs, Arms, Back, Chest, Legs, Shoulders
}

// Class Workout
//
class ClassWorkout: _Workout {
    let title: ClassWorkoutOptions
    let color: UIColor = .blueColor()
    
    init(duration: Int, title: ClassWorkoutOptions) {
        self.title = title
        super.init(duration: duration)
    }
}

enum ClassWorkoutOptions {
    case Barre, Crossfit, Dance, MartialArts, Pilates, Yoga
}

// Sports
//
class SportsWorkout: _Workout {
    let title: Sport
    let color: UIColor = .greenColor()
    
    init(duration:Int, title: Sport) {
        self.title = title
        super.init(duration: duration)
    }
}

enum Sport {
    case Basketball, Soccer, Football, Golf
}