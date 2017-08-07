//
//  ViewController3ViewController.swift
//  N
//
//  Created by 碓氷隼也 on 2017/08/07.
//  Copyright © 2017年 碓氷隼也. All rights reserved.
//

import UIKit
import Foundation

class ViewController3: UIViewController {
    
    var timer:Timer = Timer()
    var diffMinute: Int = 0
    var diffHour: Int = 0
    let strHour:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let strMinute:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        let now = Date()

        print(formatter.string(from: now))
        let str = formatter.string(from: now)
        let split = str.components(separatedBy: "-")
        
        let diff = timeDiff(hour: Int(split[3])!,minute: Int(split[4])!,second: Int(split[5])!)
        print("diff")
        print(diff)
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(diff),
                                     target: self,                   //
            selector: #selector(ViewController3.changeView),
            userInfo: nil,                  //
            repeats: false)                 //追加
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func changeView() {
        self.performSegue(withIdentifier: "toSleep",sender: nil)
    }
    
    func timeDiff(hour: Int, minute: Int, second:Int)-> Int {
        if Int(strHour.Hour)! - hour < 0 {
            diffHour = -1*(Int(strHour.Hour)!-hour)+24
            print(diffHour)
            print("a")
        }
        else {
            diffHour = Int(strHour.Hour)!-hour
            print(diffHour)
            print("b")
        }
        if Int(strMinute.Minute)! - minute < 0 {
            diffMinute = -1*(Int(strMinute.Minute)!-minute)+59
            print(diffMinute)
            print("c")
        }
        else {
            diffMinute = Int(strMinute.Minute)!-minute-1
            print(diffMinute)
            print("d")
        }
        return 3600*diffHour+60*diffMinute+60-second
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
