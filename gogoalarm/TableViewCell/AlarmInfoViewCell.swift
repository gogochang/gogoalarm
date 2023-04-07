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
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            contentView.backgroundColor = UIColor.white.withAlphaComponent(1)
        } else {
            contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
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
        
        // Cell 배경 불투명
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        // Cell 모서리
        contentView.layer.cornerRadius = 8
        
        // Cell 그림자
        contentView.layer.shadowColor = UIColor.black.cgColor //색상
        contentView.layer.shadowOpacity = 0.3 //alpha값
        contentView.layer.shadowRadius = 5 //반경
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1) //위치조정
        contentView.layer.masksToBounds = false

        // Cell 크기 조절 ( 안으로 5만큼씩 )
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top:5.0, left: 5.0, bottom: 5.0, right: 5.0))
    }
    
}
