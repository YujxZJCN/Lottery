//
//  ViewController.swift
//  Lottery
//
//  Created by 俞佳兴 on 2019/12/10.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uuidLabel: UILabel!
    @IBAction func generateButton(_ sender: UIButton) {
        let uuid = UUID.init().uuidString.components(separatedBy: "-")[0]
        print(uuid)
        uuidLabel.text = uuid
        allNames.append(uuid)
        numberLabel.text = "\(allNames.count)个"
        UserDefaults.standard.removeObject(forKey: "AllNames")
        UserDefaults.standard.set(allNames, forKey: "AllNames")
    }
    @IBOutlet var numberLabel: UILabel!
    
    @IBAction func removeAll(_ sender: UIButton) {
        let alert = UIAlertController(title: "移除所有？", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .destructive, handler: { (action) in
            UserDefaults.standard.removeObject(forKey: "AllNames")
            allNames.removeAll()
            self.numberLabel.text = "\(allNames.count)个"
            self.uuidLabel.text = "XXXXXXXX"
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .default, handler: { (action) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        uuidLabel.text = "XXXXXXXX"
        if let names = UserDefaults.standard.array(forKey: "AllNames") as? [String] {
            allNames = names
            numberLabel.text = "\(allNames.count)个"
        }
    }


}

