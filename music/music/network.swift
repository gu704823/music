//
//  network.swift
//  music
//
//  Created by jason on 2017/4/19.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import Alamofire
enum methodtype{
    case post
    case get
}
class network: NSObject {
    class func requestdata(url:String,method:methodtype,parameters:[String:String]?=nil,completion:@escaping (_ result:Any)->()){
        let type = method == methodtype.get ? HTTPMethod.get:HTTPMethod.post
        Alamofire.request(url, method: type, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else{
                print(response.result.error ?? "error")
                return
            }
            completion(result)
        }
    }
}
