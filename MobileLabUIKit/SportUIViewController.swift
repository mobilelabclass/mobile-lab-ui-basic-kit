//
//  SportUIViewController.swift
//  MobileLabUIKit
//
//  Created by Nien Lam on 12/14/17.
//  Copyright © 2017 Mobile Lab. All rights reserved.
//
//  Description:
//  View controller Sport UI theme.

import UIKit

class SportUIViewController: UIViewController {

    @IBOutlet weak var displayTimeLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!

    var startTime = TimeInterval()
    var sinceStopTime = TimeInterval()

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startStopButton.setTitle("Stop", for: .selected)
        startStopButton.setTitle("Start", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handleStartButton(_ sender: UIButton) {
        // Toggle button state.
        startStopButton.isSelected = !startStopButton.isSelected

        if (!startStopButton.isSelected) {
            sinceStopTime = Date().timeIntervalSinceReferenceDate - startTime
            timer.invalidate()
        }
        else if (!timer.isValid) {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate - sinceStopTime
        }

    
    }
    
    
    @IBAction func handleResetButton(_ sender: UIButton) {
        timer.invalidate()
        sinceStopTime = 0
        displayTimeLabel.text = "00:00:00"
    }
    
    @objc
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        
        // Find the difference between current time and start time.
        var elapsedTime: TimeInterval = currentTime - startTime
        
        // calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        // calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        
        // find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        // add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        // concatenate minuets, seconds and milliseconds as assign it to the UILabel
        displayTimeLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
    }

}
