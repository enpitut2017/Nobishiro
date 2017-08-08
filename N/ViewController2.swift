//
//  ViewController2.swift
//  N
//
//  Created by 碓氷隼也 on 2017/08/07.
//  Copyright © 2017年 碓氷隼也. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var setTime: UILabel!
    @IBOutlet weak var setsumeiText: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    
    @IBOutlet weak var hourSwitch: UISwitch!
    
    @IBOutlet weak var myHour: UIPickerView!
    
    @IBAction func hourSwitchAction(_ sender: UISwitch) {
        let appDelgate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        if ( sender.isOn ) {
            appDelgate.hourChecker = true
            hourLabel.text = "設定しました"
            setTime.text = "毎日 \(appDelgate.NotificationHour): 00 にリマインドします"
        } else {
            appDelgate.hourChecker = false
            hourLabel.text = "設定します"
            setTime.text = "設定されていません"
        }
    }

    
    let hourList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
        
        
    //コンポーネントの個数を返すメソッド
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hourList.count
    }
    
    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hourList[row] as String
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let strNotificationHour:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let data = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        strNotificationHour.NotificationHour = data!
        
        if(strNotificationHour.hourChecker == false) {
        self.setTime.text = "設定されていません"
        } else {
            self.setTime.text = "毎日 \(data!): 00 にリマインドします"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
       
        setsumeiText.numberOfLines = 2;
        setsumeiText.text = "寝る時間を設定し忘れていることを\nリマインドする機能です"
      
        hourLabel.text = "設定します"
        hourSwitch.isOn = false
        setTime.text = "設定されていません"
        
        let strNotificationHour:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        strNotificationHour.NotificationHour = "0"

        
        myHour.delegate = self
        myHour.dataSource = self
        self.view.addSubview(myHour)
        
        let strHour:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let strMinute:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        strHour.Hour = "0"
        strMinute.Minute = "00"

         super.viewDidLoad()
        // Do any additional setup after loading the view.
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
