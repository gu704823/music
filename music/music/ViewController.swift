//
//  ViewController.swift
//  music
//
//  Created by jason on 2017/4/19.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UIViewController {
    @IBOutlet weak var fengmian: roundimage!
    @IBOutlet weak var beijing: UIImageView!
    @IBOutlet weak var musiclist: UITableView!

    var channeldatas:[JSON]?
    var tabledata:[JSON]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    //设置ui
      setupui()
    }
    //懒加载数据模型
    fileprivate lazy var viewvm:httpmodel = httpmodel()
}
//处理ui,数据
extension ViewController{
    fileprivate func setupui(){
      //封面转起来
        fengmian.onrotation()
     //背景模糊
       let blureffect = UIBlurEffect(style: .light)
       let blurview = UIVisualEffectView(effect: blureffect)
        blurview.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        beijing.addSubview(blurview)
    //数据源代理
        musiclist.delegate = self
        musiclist.dataSource = self
    //加载数据
        loaddata()
       
        
        
    }
}
//遵守tableview数据源协议
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musiclist.dequeueReusableCell(withIdentifier: "musiclist", for: indexPath)
        cell.textLabel?.text = "歌曲\(indexPath.item)"
        cell.detailTextLabel?.text = "作者\(indexPath.item)"
        cell.imageView?.image = UIImage(named: "thumb")
        return cell
    }
    
}
//发送网络请求
extension ViewController{
    fileprivate func loaddata(){
        viewvm.requestdata { (data1) in
            print(data1)
            self.channeldatas = data1
        }
    }
}


