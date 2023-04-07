//
//  AlarmInfoViewCell.swift
//  gogoalarm
//
//  Created by 김창규 on 2023/04/06.
//

import UIKit

class AlarmInfoViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    
    private var didSelected: Bool = false
    
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("2")
            contentView.backgroundColor = UIColor.white.withAlphaComponent(1)
        } else {
            contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            print("#")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        contentView.layer.shadowColor = UIColor.black.cgColor //색상
        contentView.layer.shadowOpacity = 0.3 //alpha값
        contentView.layer.shadowRadius = 5 //반경
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1) //위치조정
        contentView.layer.masksToBounds = false
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top:5.0, left: 5.0, bottom: 5.0, right: 5.0))
    }
    
}
