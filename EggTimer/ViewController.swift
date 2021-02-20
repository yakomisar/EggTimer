//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let timerDict = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timer: Timer?
    var timeToCook = 0
    var secondsRemain = 0
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimer()
    }
    
    @objc func timerCount() {
        if secondsRemain > 0 {
            progressBar.progress += (1.0/Float(timeToCook))
            titleLabel.text = "Time to cook: \(secondsRemain) seconds"
            secondsRemain-=1
        } else {
            stopTimer()
            titleLabel.text = "It is cooked!"
            playSound()
        }
    }
    
    func initTimer() {
        stopTimer()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
    }
    
    func setupTimer() {
        if progressBar.isHidden {
           progressBar.isHidden = false
        } else {
           progressBar.isHidden = true
           progressBar.progress = 0
        }
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        setupTimer()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else {
            return
        }
        switch text {
        case "Soft":
            timeToCook = timerDict["\(text)"]!
            secondsRemain = timeToCook
            initTimer()
        case "Medium":
            timeToCook = timerDict["\(text)"]!
            secondsRemain = timeToCook
            initTimer()
        case "Hard":
            timeToCook = timerDict["\(text)"]!
            secondsRemain = timeToCook
            initTimer()
        default:
            break
        }
    }
    
}
