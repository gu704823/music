//
//  roundimage.swift
//  music
//
//  Created by jason on 2017/4/19.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class roundimage: UIImageView {
    //拖控件用此方法(改变nib的属性)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //设置圆角
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.width/2
        //边距
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7).cgColor
        
    }
    //旋转
    func onrotation(){
        let animaition = CABasicAnimation(keyPath: "transform.rotation")
        animaition.fromValue = 0
        animaition.toValue = M_PI*2
        animaition.duration = 20
        animaition.repeatCount = MAXFLOAT
        self.layer.add(animaition, forKey: "")
    }
    
    
    
    
    
    //纯代码创建用此方法
//    override init(frame: CGRect) {
//
//    }
}
