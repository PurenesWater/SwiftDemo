//
//  MainHeadReusableView.swift
//  SwiftStatue
//
//  Created by 凌志 on 2020/7/14.
//  Copyright © 2020 凌志. All rights reserved.
//

import UIKit

class MainHeadReusableView: UICollectionReusableView {
 
    var headView:UIView?
    var titleLab:UILabel?
    var allBut:UIButton?
    var markImg:UIImageView?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        initUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  initUi()  {
        
        headView = UIView.init(frame: self.bounds)
        headView?.backgroundColor = UIColor.red
        self.addSubview(headView!)
        
        markImg = UIImageView.init(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        markImg?.center.y = self.center.y
        markImg?.layer.cornerRadius = 16
        markImg?.backgroundColor = UIColor.blue
        headView?.addSubview(markImg!)
        
        titleLab = UILabel.init(frame: CGRect(x:  50, y:0 , width: 100, height: self.bounds.height))
        titleLab?.center.y = self.center.y
        titleLab?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        headView?.addSubview(titleLab!)
    
    }
}
