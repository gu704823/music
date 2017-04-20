//
//  songgroup.swift
//  music
//
//  Created by jason on 2017/4/20.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class songgroup: NSObject {
    var url:String = ""
    var title:String = ""
    var picture:String = ""
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

}
