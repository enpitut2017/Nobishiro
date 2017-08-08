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
        let Hour: Int = Int(strHour.Hour)!
        let Minute: Int = Int(strMinute.Minute)!
        
        var ans: Int = 0
        if (hour == Hour) {
            ans = (Minute-minute-1)*60+60-second
        }
        else if(Hour>hour) {
            if (Minute >= minute) {
                ans = (Hour-hour)*3600+(Minute-minute-1)*60+60-second
            }
            else {
                ans = (Hour-hour-1)*3600+(Minute-minute+60-1)*60+60-second
            }
        }
        else {
            if (Minute>=minute) {
                ans = (Hour-hour+24)*3600+(Minute-minute-1)*60+60-second
            }
            else {
                ans = (Hour-hour+23)*3600+(Minute-minute+60-1)*60+60-second
            }
        }
        return ans
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
