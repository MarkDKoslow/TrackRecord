 //
//  FeedViewController.swift
//  TrackRecord
//
//  Created by Mark Koslow on 5/28/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit
import Cartography
import TZStackView
import ReactiveCocoa

class FeedViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var workoutHistoryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.backgroundColor = UIColor.redColor()
        workoutHistoryTableView.backgroundColor = UIColor.blueColor()
        
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

extension FeedViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->  UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }


}