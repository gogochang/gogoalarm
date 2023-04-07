//
//  AlarmSettingViewController.swift
//  gogoalarm
//
//  Created by 김창규 on 2023/04/07.
//

import UIKit

class AlarmSettingViewController: UIViewController {

    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var differenceTime: UILabel!
    
    private var date: String = ""
    private var timer: Timer?
    
    override func viewDidLoad() {
        print("AlarmSettingViewController - viewDidLoad() called")
        super.viewDidLoad()

        configureUI()
    }
}

//MARK: Action
extension AlarmSettingViewController {
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter() // Date 타입과 관련된 포맷터
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ko_KR")
        self.date = formatter.string(from: datePicker.date)
        print("AlarmSettingViewController - datePickerChanged()/ changed date : \(self.date)")
    }
    
    @IBAction func dismissBtnClicked(_ sender: UIButton) {
        print("AlarmSettingViewController - dismissBtnClicked() called")
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

//MARK: UI
extension AlarmSettingViewController {
    private func configureUI() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.date = Date()
        datePicker.timeZone = TimeZone(identifier: "Asia/Seoul")
        datePicker.translatesAutoresizingMaskIntoConstraints = false
    }
}
