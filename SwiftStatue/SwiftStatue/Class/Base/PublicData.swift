//
//  PublicData.swift
//  SwiftStatue
//
//  Created by 凌志 on 2020/7/14.
//  Copyright © 2020 凌志. All rights reserved.
//

import Foundation
import UIKit

let kWidth = UIScreen.main.bounds.size.width
let kHeight =  UIScreen.main.bounds.size.height
let  kStatuHig = UIApplication.shared.statusBarFrame.size.height
let  kBotHig  = (kStatuHig > 20 ? 34.0 : 0.0)
let  kTabHig =  (kStatuHig > 20 ? 83.0 : 49.0)
let  kNavHig =  (kStatuHig > 20 ? 88.0 : 64.0)
func  randomColorAlpha() ->UIColor {
    
    return  UIColor.init(red:CGFloat(Float(arc4random() % 255)/255.0), green: CGFloat(Float(arc4random() % 255)/255.0), blue: CGFloat(Float(arc4random() % 255)/255.0), alpha: 1.0)
}
