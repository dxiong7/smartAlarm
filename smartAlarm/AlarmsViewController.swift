//
//  AlarmsViewController.swift
//  smartAlarm
//
//  Created by Daniel Xiong on 5/15/19.
//  Copyright © 2019 danielxiong523. All rights reserved.
//

import UIKit

class AlarmsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var datePicker: UIDatePicker?
    var alarmArray = [String]()
    
    @IBOutlet weak var alarmField: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell") as! AlarmTableViewCell
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        
        alarmField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(AlarmsViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AlarmsViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        alarmField.text = dateFormatter.string(from: datePicker.date)
        //view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
