//
//  ViewController.swift
//  gogoalarm
//
//  Created by 김창규 on 2023/04/05.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    //UI Items
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var addAlarmBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var alarmTableView: UITableView!
    
    //TableView Items
    let cellName = "AlarmInfoViewCell"
    let cellReuseIdentifier = "AlarmInfoViewCell"
    
    //Alarm Data
    var alarms: [AlarmData] = [AlarmData(count: 10, time: "00:00")]
    var data = Array(1...3)
    
    //Alarm Add Button
    var isAddBtnClicked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController - viewDidLoad() called")
        
        setUpUI()
        setUpTableView()
    }
}

//MARK: Action
extension MainViewController {
    //AddButton
    @IBAction func addBtnClicked(_ sender: UIButton) {
        print("MainViewController - addBtnClicked() called")
        if isAddBtnClicked {
            showUI()
        } else {
            hideUI()
        }
    }
    
    @IBAction func addAlarmBtnClicked(_ sender: UIButton) {
        print("MainViewController - addAlarmBtnClicked() called")
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        print("MainViewController - backBtnClicked() called")
        self.showUI()
    }
    
    // AddButton 클릭 시 비활성화 표시하는 UI 가리기
    private func showUI() {
        print("MainViewController - hide() called")
        UIView.animate(withDuration: 0.3) {
            self.addBtn.transform = CGAffineTransform.identity
            self.addAlarmBtn.alpha = 0.0
            self.backBtn.alpha = 0
        }
        self.isAddBtnClicked = false
    }
    
    // AddButton 클릭 시 비활성화 표시하는 UI 보여주기
    private func hideUI() {
        print("MainViewController - show() called")
        UIView.animate(withDuration: 0.3) {
            self.addBtn.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            self.addAlarmBtn.alpha = 1
            self.backBtn.alpha = 0.5
        }
        self.isAddBtnClicked = true
    }
}

//MARK: View
extension MainViewController {
    //Setup TableView
    private func setUpTableView() {
        alarmTableView.dataSource = self
        alarmTableView.delegate = self
        alarmTableView.separatorStyle = .none
        alarmTableView.showsVerticalScrollIndicator = false
        
        let nibName = UINib(nibName: cellName, bundle: nil)
        alarmTableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    //Setup UI
    private func setUpUI() {
        print("ViewController - setUpUI() called")
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // Add Alarm Button
        addBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        addBtn.layer.cornerRadius = addBtn.frame.size.width / 2.0
        addBtn.clipsToBounds = true

        addAlarmBtn.setImage(UIImage(systemName: "alarm.fill"), for: .normal)
        addAlarmBtn.layer.cornerRadius = addBtn.frame.size.width / 2.0
        addAlarmBtn.clipsToBounds = true
        
    }
    
}

//MARK: TableView
extension MainViewController: UITableViewDataSource {
    // Row Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    // Row Configure
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! AlarmInfoViewCell
        cell.backgroundColor = UIColor.clear.withAlphaComponent(0)
        cell.selectionStyle = .none
        cell.alarmSwitch.isOn = false
        
        cell.timeLabel.text = alarms[indexPath.row].time
        
        return cell
    }
}
