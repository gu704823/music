//
//  httpmodel.swift
//  music
//
//  Created by jason on 2017/4/19.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import SwiftyJSON
class httpmodel: NSObject {
  //属性
     lazy var namegroups:[namegroup] = [namegroup]()
    lazy var songgroups:[songgroup] = [songgroup]()
}
//请求数据
//闭包
extension httpmodel{
    func requestdata1(completion:@escaping()->()){
       
        
        
        let url1 = "https://www.douban.com/j/app/radio/channels"
        network.requestdata(url: url1, method: .get) { (result) in
            guard let resultdict = result as? [String:NSObject] else {
                return
            }
            guard let dataarry = resultdict["channels"] as? [[String:NSObject]] else{
                return
            }
            for dict in dataarry {
                let dataarry = namegroup(dict: dict)
                self.namegroups.append(dataarry)
            }
            completion()
        }
    }
        func requestdata2(completion:@escaping()->()){
            
            
            
            let url2 = "https://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite"
            network.requestdata(url: url2, method: .get) { (result) in
                guard let resultdict = result as? [String:NSObject] else {
                    return
                }
                guard let dataarry = resultdict["song"] as? [[String:NSObject]] else{
                    return
                }
                for dict in dataarry {
                    let dataarry = songgroup(dict: dict)
                    self.songgroups.append(dataarry)
                }
                completion()
            }
//        let url2 = "https://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite
    }
  }

