//
//  ViewController.swift
//  N
//
//  Created by 碓氷隼也 on 2017/08/02.
//  Copyright © 2017年 碓氷隼也. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var isActive: UISwitch!
    @IBOutlet weak var isActiveLabel: UILabel!
    @IBOutlet weak var setText: UILabel!
    
    
    @IBAction func OnOffChange(_ sender: UISwitch) {
        let appDelgate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        timeLabel.text = "今日は \(appDelgate.Hour) : \(appDelgate.Minute) には寝ます"
        if ( sender.isOn ) {
            appDelgate.buttonChecker = true
            isActiveLabel.text = "設定しました"
            setText.text = " "
        } else {
            appDelgate.buttonChecker = false
            isActiveLabel.text = "設定します"
            setText.text = "設定されていません"
        }
    }
    
    let dataList = [["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"],
                   ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13","14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]]

    
    //コンポーネントの個数を返すメソッド
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataList.count
    }
    
    
    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList[component].count
    }
    
    
    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[component][row]
    }
    
    
    //データ選択時の呼び出しメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //コンポーネントごとに現在選択されているデータを取得する。
        
        let strHour:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let strMinute:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        
        let data1 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        let data2 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 1), forComponent: 1)        
        strHour.Hour = data1!
        strMinute.Minute = data2!
        
        self.timeLabel.text = "今日は \(data1!) : \(data2!) には寝ます"
        if(strHour.buttonChecker == true && strMinute.buttonChecker == true) {
            self.setText.text = " "
        } else {
            self.setText.text = "設定されていません"
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        isActiveLabel.text = "設定します"
        isActive.isOn = false
        timeLabel.text = "今日は 0 : 00 には寝ます"
        setText.text = "設定されていません"
        
        let strHour:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let strMinute:AppDelegate = UIApplication.shared.delegate as! AppDelegate
  
        strHour.Hour = "0"
        strMinute.Minute = "00"
        
        let strNotificationHour:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        strNotificationHour.NotificationHour = "0"
 
        super.viewDidLoad()
        
    }

}
