//
//  AlertPopUpViewController.swift
//  gogoalarm
//
//  Created by 김창규 on 2023/04/08.
//

import UIKit

class AlertPopUpViewController: UIViewController {
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var okBtn: UIButton!
    
    weak var delegate: AlarmSettingViewControllerDelegate?
    
    override func viewDidLoad() {
        print("AlertPopUpViewController - viewDidLoad() called")
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
}

//MARK: Action
extension AlertPopUpViewController {
    
    @IBAction func okBtnClicked(_ sender: Any) {
        print("AlertPopUpViewController - okBtnClicked() called")
        delegate?.alarmSettingViewControllerDidFinish()
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
        //TODO: AlarmSettingView 종료
        
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        print("AlertPopUpViewController - backBtnClicked() called")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
//MARK: UI
extension AlertPopUpViewController {
    private func configureUI() {
        print("AlertPopUpViewController - configureUI() called")
        alertView.layer.cornerRadius = 16
        okBtn.layer.cornerRadius = 16
    }
}
