//
//  NewsViewCell.swift
//  News2
//
//  Created by 湛伟chun on 2020/2/18.
//  Copyright © 2020 sittone. All rights reserved.
//

import UIKit
import Kingfisher

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var replyCount: UILabel!
    
    var newsModel:NewsMode?{
        didSet{
            title.text = newsModel?.title;
            source.text = newsModel?.source
            replyCount.text = "\( newsModel?.replyCount ?? 0)跟帖"
            img.kf.setImage(with: URL(string: newsModel?.imgsrc ?? ""))
        }
    }
    
}
