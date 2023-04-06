//
//  CurrentTime.swift
//  gogoalarm
//
//  Created by 김창규 on 2023/04/06.
//

import Foundation

struct CurrentTime {
    enum Component {
        case hour, minute, second
    }
    
    func showCurrentTime(timeComponent: Component) -> String {
        let calendar = NSCalendar.current
        
        switch timeComponent {
        case .hour:
            let hour = calendar.component(.hour,from: NSDate() as Date)
            return String(hour)
        case .minute:
            let minute = calendar.component(.minute, from: NSDate() as Date)
            return String(minute)
        case .second:
            let second = calendar.component(.second, from: NSDate() as Date)
            return String(second)
        }
    }
}
