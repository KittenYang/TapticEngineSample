//
//  ViewController.swift
//  TapticEngineSample
//
//  Created by Kitten x iDaily on 16/9/30.
//  Copyright © 2016年 KittenYang. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    let log = OSLog(subsystem: "com.kittenyang.TapticEngineSample", category: "UI")
    let generator = UINotificationFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func notificationFeedbackAction(_ sender: UIButton) {
        guard let type = UINotificationFeedbackType(rawValue: sender.tag) else {
            fatalError("Can not convert tag to UINotificationFeedbackType")
        }
        generator.prepare()
        generator.notificationOccurred(type)
        
        os_log("UINotificationFeedbackType: %lu", log: log, type: .debug, type.rawValue)
    }
    
    @IBAction func impactFeedbackAction(_ sender: UIButton) {
        guard let style = UIImpactFeedbackStyle(rawValue: sender.tag) else {
            fatalError("Can not convert tag to UIImpactFeedbackStyle")
        }

        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
        
        os_log("UIImpactFeedbackStyle: %lu", log: log, type: .debug, style.rawValue)
    }
    
    @IBAction func selectionFeedbackAction(_ sender: UIButton) {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
    
}

