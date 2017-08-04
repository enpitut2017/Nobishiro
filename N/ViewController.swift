//
//  ViewController.swift
//  N
//
//  Created by 碓氷隼也 on 2017/08/02.
//  Copyright © 2017年 碓氷隼也. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var myLabel: UILabel!
    
    let dataList = [[Int](0...23), [Int](00...59)]
    
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
        return String(dataList[component][row])
    }
    
    
    //データ選択時の呼び出しメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //コンポーネントごとに現在選択されているデータを取得する。
        
        let strHour:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let strMinute:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        
        let data1 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        let data2 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 1), forComponent: 1)
        //let data3 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 2), //forComponent: 2)
        
        strHour.Hour = data1!
        strMinute.Minute = data2!
        
        myLabel.text = "\(data1!) :\(data2!)"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "時間を設定して、アプリを閉じてください"
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
