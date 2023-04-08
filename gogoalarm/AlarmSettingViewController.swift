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
    @IBOutlet weak var repeatSettingBtn: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var doneBtn: UIButton!
    
    private var date: String = ""
    private var timer: Timer?
    
    override func viewDidLoad() {
        print("AlarmSettingViewController - viewDidLoad() called")
        super.viewDidLoad()
        configureUI() // UI 설정
    }
}

//MARK: Action
extension AlarmSettingViewController {
    
    // 시간 선택 및 변화 감지
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter() // Date 타입과 관련된 포맷터
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ko_KR")
        self.date = formatter.string(from: datePicker.date)
        print("AlarmSettingViewController - datePickerChanged()/ changed date : \(self.date)")
    }
    
    // 뒤로가기 버튼
    @IBAction func dismissBtnClicked(_ sender: UIButton) {
        print("AlarmSettingViewController - dismissBtnClicked() called")
        let alertPopUpVC = storyboard?.instantiateViewController(withIdentifier: "AlertPopUpViewController") as! AlertPopUpViewController
        alertPopUpVC.delegate = self
        alertPopUpVC.modalTransitionStyle = .crossDissolve
        alertPopUpVC.modalPresentationStyle = .overFullScreen
        self.present(alertPopUpVC, animated: true, completion: nil)
    }
    
    // 완료 버튼
    @IBAction func doneBtnClicked(_ sender: UIButton) {
        print("AlarmSettingViewController - doneBtnClicked() called")
        //TODO: 설정된 데이터를 Main으로 전달하여 Alarm Date 추가, 알람 설정
    }
}

//MARK: UI
extension AlarmSettingViewController {
    private func configureUI() {
        // 시간 선택 UI
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.date = Date()
        datePicker.timeZone = TimeZone(identifier: "Asia/Seoul")
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        // 완료 버튼 UI
        doneBtn.layer.cornerRadius = 16
    }
}

//MARK: Delegate Pattern
extension AlarmSettingViewController: AlarmSettingViewControllerDelegate {
    // Alarm Setting View 종료
    func alarmSettingViewControllerDidFinish() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

//Delegate Pattern Protocol
protocol AlarmSettingViewControllerDelegate: AnyObject {
    // Alert PopUp에서 데이터 가져오기 위함
    func alarmSettingViewControllerDidFinish()
}
