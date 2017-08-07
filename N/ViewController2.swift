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
    
    @IBOutlet weak var myHour: UIPickerView!
  
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
        
        self.setTime.text = "\(data!) :00"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
             
        myHour.delegate = self
        myHour.dataSource = self
        self.view.addSubview(myHour)
        // Do any additional setup after loading the view.
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
