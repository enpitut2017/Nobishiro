//
//  ViewController3ViewController.swift
//  N
//
//  Created by 碓氷隼也 on 2017/08/07.
//  Copyright © 2017年 碓氷隼也. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    var timer:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 5,
                                     target: self,                   //
            selector: #selector(ViewController3.changeView),
            userInfo: nil,                  //
            repeats: false)                 //追加
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func changeView() {
        self.performSegue(withIdentifier: "toSleep",sender: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
