//
//  ViewController.swift
//  gogoalarm
//
//  Created by 김창규 on 2023/04/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var alarmTableView: UITableView!
    
    
    let cellName = "AlarmInfoViewCell"
    let cellReuseIdentifier = "AlarmInfoViewCell"
    
    let cellSpacingHeight: CGFloat = 20
    
    let data = Array(1...3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpTableView()
    }
    
    private func setUpTableView() {
        alarmTableView.dataSource = self
        alarmTableView.delegate = self
        alarmTableView.separatorStyle = .none
        alarmTableView.showsVerticalScrollIndicator = false
        
        let nibName = UINib(nibName: cellName, bundle: nil)
        alarmTableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    private func setUpUI() {
        print("ViewController - setUpUI() called")
        
    
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // Add Alarm Button
        addBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        addBtn.layer.cornerRadius = addBtn.frame.size.width / 2.0
        addBtn.clipsToBounds = true
    }
}

extension ViewController: UITableViewDataSource {
    // Section당 Row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

//    func tableview(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! AlarmInfoViewCell
        cell.backgroundColor = UIColor.clear.withAlphaComponent(0)
        cell.selectionStyle = .none
        cell.alarmSwitch.isOn = false
        
        return cell
    }
}

