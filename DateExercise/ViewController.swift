//
//  ViewController.swift
//  DateExercise
//
//  Created by mac on 2018/7/31.
//  Copyright © 2018年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let now = Date()
    let formatter = DateFormatter()
    @IBOutlet weak var selectDateLabel: UILabel!
    @IBOutlet weak var nowDateLabel: UILabel!
    @IBOutlet weak var timeIntervalSinceLabel: UILabel!
    
    @IBOutlet weak var intervalDayLabel: UILabel!
    @IBAction func selectDatePicker(_ sender: UIDatePicker) {
        let selectDate = sender.date
        let selectDateString = formatter.string(from: selectDate)
        let nowDateString = formatter.string(from: now)
        selectDateLabel.text = selectDateString
        nowDateLabel.text = nowDateString
        
        //計算時間差距
        if selectDate+1>now{
            let intervalTime = Int(selectDate.timeIntervalSince(now))+1
            let intervalDay = intervalTime/60/60/24
            let intervalHour = (intervalTime/60/60)%24
            let intervalMin = intervalTime%(60*60)/60
            
            timeIntervalSinceLabel.text = "距離現在\(intervalDay)天\(intervalHour)時\(intervalMin)分"
            intervalDayLabel.text = "\(intervalDay)"
        }else{
            let intervalTime = Int(now.timeIntervalSince(selectDate))+1
            let intervalDay = intervalTime/60/60/24
            let interValHour = (intervalTime/60/60)%24
            let interValMin = intervalTime/60%60
            timeIntervalSinceLabel.text = "距離過去\(intervalDay)天\(interValHour)時\(interValMin)分"
            intervalDayLabel.text = "-\(intervalDay)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "yyyy年MM月dd日 HH時：mm分"
        let dateString = formatter.string(from: now)
        nowDateLabel.text = dateString
        // Do any additional setup after loading the view, typically from a nib.
    }


}

