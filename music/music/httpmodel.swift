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
    
}
//请求数据
//闭包
extension httpmodel{
    func requestdata(completion:@escaping(_ data:[JSON])->()){
       
        
        
        let url1 = "https://www.douban.com/j/app/radio/channels"
        network.requestdata(url: url1, method: .get) { (result) in
            let json = JSON(result)
            guard let channels = json["channels"].array else{
                return
            }
            completion(channels)
        }
//        let url2 = "https://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite"
//        network.requestdata(url: url2, method: .get) { (result) in
//            let jsonn = JSON(result)
//            guard let songs = jsonn["song"].array else{
//                return
//            }
//           self.tabledata = songs
//            print(self.tabledata)
//        }
       
    }
}
