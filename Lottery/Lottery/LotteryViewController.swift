//
//  LotteryViewController.swift
//  Lottery
//
//  Created by 俞佳兴 on 2019/12/10.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

var allNames = [String]()

class LotteryViewController: UIViewController {

    @IBOutlet var startButton: UIButton! {
        didSet {
            self.startButton.clipsToBounds = true
            self.startButton.layer.cornerRadius = 8.0
        }
    }
    
    @IBOutlet var nameLabel: UILabel!
    var timer: Timer!
    
    @IBAction func start(_ sender: UIButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(startShuffle), userInfo: nil, repeats: true)
            timer.fire()
            startButton.setTitle("Stop", for: .normal)
        } else {
            timer.invalidate()
            index = 0
            timer = nil
            startButton.setTitle("Start", for: .normal)
        }
    }
    
    var index = 0
    
    @objc func startShuffle() {
        if allNames.count == 0 {
            index = 0
            return
        }
        nameLabel.text = allNames[index]
        
        index += 1
        if index == allNames.count {
            index = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.nameLabel.text = "XXXXXXXX"
        if allNames.count == 0 {
            startButton.isEnabled = false
        } else {
            startButton.isEnabled = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
