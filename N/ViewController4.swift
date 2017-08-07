//
//  ViewController4.swift
//  N
//
//  Created by 碓氷隼也 on 2017/08/07.
//  Copyright © 2017年 碓氷隼也. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        _ = UIScreen.main
        // set the current value on the slider
        
        NotificationCenter.default.addObserver(self,selector: #selector(brightnessChanged(_:)),name: NSNotification.Name.UIScreenBrightnessDidChange,object: nil)

    }
    
    func brightnessChanged(_ notification: Notification) {
        if notification.object != nil {
        }
    }
    
    @IBAction func screendark(_ sender: UIButton) {
        UIScreen.main.brightness = CGFloat(0.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
