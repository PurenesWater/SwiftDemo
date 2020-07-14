//
//  HomeHeadView.swift
//  SwiftStatue
//
//  Created by 凌志 on 2020/7/14.
//  Copyright © 2020 凌志. All rights reserved.
//

import UIKit

class HomeHeadView: UIView {

    
    var  nickName:UILabel?
    var  headView:UIView?
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        setUpUi()

    }
    
//
//     init(frame: CGRect , color:UIColor) {
//
//
//
//
//    }
    
    func  setUpUi() {
        
         headView = UIView.init(frame: self.bounds)
         headView?.backgroundColor = UIColor.red

         let headIamge = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
         headIamge.center.x = headView!.center.x
         headIamge.backgroundColor = UIColor.purple
         headIamge.layer.cornerRadius = 50
        headView?.addSubview(headIamge)
        
        nickName = UILabel.init(frame: CGRect(x: 0, y:headIamge.bounds.maxY  , width: self.bounds.width, height: 30))
        nickName?.text = "这是标题"
        nickName?.textColor = UIColor.black
        nickName?.font = UIFont.systemFont(ofSize: 15)
        nickName?.textAlignment = NSTextAlignment.center
        headView?.addSubview(nickName!)
        
        self.addSubview(headView!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
