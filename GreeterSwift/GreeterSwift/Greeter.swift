//
//  Greeter.swift
//  GreeterSwift
//
//  Created by guanchengyun on 2022/8/6.
//  Copyright © 2022 chengyun. All rights reserved.
//

import UIKit

struct Greeter {
    var client: Client = .normal
}

enum Client {
    case normal//不好扩展
    case editTime(morning: UInt, afternoon: UInt, evening: UInt)//可编辑时间
    
    func outputString(output: Output = .normalOut) -> String {
        switch self {
        case .editTime(let morning, let afternoon, let evening):
            return outputBy(output: output, morning: morning, afternoon: afternoon, evening: evening)
        default:
            return outputBy(output: output)
        }
    }
    
    private func outputBy(output: Output, morning: UInt = 6, afternoon: UInt = 12, evening: UInt = 18) -> String {
        guard morning < 24,
              afternoon < 24,
              evening < 24 else {
                assert(true, "超过最大数")
            return ""
        }
        
        let calendar = Calendar.current
        let now = Date()
        let morning_today = calendar.date(bySettingHour: Int(morning), minute: 0, second: 0, of: now)!
        let afternoon_today = calendar.date(bySettingHour: Int(afternoon), minute: 0, second: 0, of: now)!
        let evening_today = calendar.date(bySettingHour: Int(evening), minute: 0, second: 0, of: now)!
        if now > morning_today && now <= afternoon_today {
            return output.morning
        } else if now > afternoon_today && now <= evening_today {
            return output.afternoon
        } else {
            return output.evening
        }
    }
}

enum Output {
    case normalOut//不好扩展
    case editOut(morning: String, afternoon: String, evening: String)//可编辑输出文案
    
    var morning: String {
        switch self {
        case .editOut(let morning, _, _):
            return morning
        default:
            return "Good morning"
        }
    }
    
    var afternoon: String {
        switch self {
        case .editOut(_, let afternoon, _):
            return afternoon
        default:
            return "Good afternoon"
        }
    }
    
    var evening: String {
        switch self {
        case .editOut(_, _, let evening):
            return evening
        default:
            return "Good evening"
        }
    }
}
