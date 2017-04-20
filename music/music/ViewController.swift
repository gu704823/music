//
//  ViewController.swift
//  music
//
//  Created by jason on 2017/4/19.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var fengmian: roundimage!
    @IBOutlet weak var beijing: UIImageView!
    @IBOutlet weak var musiclist: UITableView!

    //懒加载数据模型
    fileprivate lazy var viewvm:httpmodel = httpmodel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置ui
        setupui()
        //加载数据
        loaddata()
    }
}
    extension ViewController{
        fileprivate func setupui(){
            ////封面转起来
            fengmian.onrotation()
            //背景模糊
            let blureffect = UIBlurEffect(style: .light)
            let blurview = UIVisualEffectView(effect: blureffect)
            blurview.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
            beijing.addSubview(blurview)
            //数据源代理
            musiclist.delegate = self
            musiclist.dataSource = self
        }
    }
//数据源代理
extension ViewController{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewvm.songgroups.count
    }
    //内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songlist = viewvm.songgroups[indexPath.row]
        let cell = musiclist.dequeueReusableCell(withIdentifier: "musiclist", for: indexPath) as! playlistTableViewCell
            cell.songlist = songlist
            return cell
    }

}
//加载数据
extension ViewController{
    fileprivate func loaddata(){
        viewvm.requestdata1 {
            
        }
        viewvm.requestdata2 {
            self.musiclist.reloadData()
        }
    }
}








