//
//  ViewController.swift
//  gogoalarm
//
//  Created by 김창규 on 2023/04/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textAlignment = .center
        label.text = "Hello, world!"
        
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

