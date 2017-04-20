//
//  playlistTableViewCell.swift
//  music
//
//  Created by jason on 2017/4/21.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class playlistTableViewCell: UITableViewCell {
    @IBOutlet weak var album: UIImageView!
    @IBOutlet weak var song: UILabel!
    @IBOutlet weak var singer: UILabel!

    var songlist:songgroup? {
        didSet{
            guard  let songlist = songlist else {
                return
            }
            song.text = songlist.title
            singer.text = songlist.url
            let url = URL(string: songlist.picture)
            album.kf.setImage(with: url)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

  

}
