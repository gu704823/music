//
//  playlistViewController.swift
//  music
//
//  Created by jason on 2017/4/19.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class playlistViewController: UIViewController {
    @IBOutlet weak var playlist: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
//设置ui
        setupui()
    }
}
//设置ui
extension playlistViewController{
    fileprivate func setupui(){
        //数据源代理
        playlist.delegate = self
        playlist.dataSource = self
    }
}
//playlist数据源代理
extension playlistViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playlist.dequeueReusableCell(withIdentifier: "playlistid", for: indexPath)
        cell.textLabel?.text = "歌曲\(indexPath.item)"
        return cell
    }
}
