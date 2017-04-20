//
//  View.swift
//  music
//
//  Created by jason on 2017/4/20.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class View: UIViewController {
    var a:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
     
      print(a ?? "nil")
        
    }
    func add(){
        let b = ["1","2","3","4"]
        a = b
    }
    
}
