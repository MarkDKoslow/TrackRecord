//
//  FirstViewController.swift
//  TrackRecord
//
//  Created by Mark Koslow on 5/28/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit
import Cartography
import TZStackView
import ReactiveCocoa
import YapDatabase

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cardio = CardioWorkout(duration: 10, distance: 2, exercise: .Spinning)
        let sports = SportsWorkout(duration: 20, title: .Soccer)
        let classwkt = ClassWorkout(duration: 60, title: .Yoga)
        
        print(cardio, sports, classwkt)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

