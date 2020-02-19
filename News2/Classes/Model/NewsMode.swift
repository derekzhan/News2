//
//  NewsMode.swift
//  News2
//
//  Created by 湛伟chun on 2020/2/18.
//  Copyright © 2020 sittone. All rights reserved.
//

import UIKit

class NewsMode: NSObject {

    //@参考：https://www.jianshu.com/p/2cef1e80042c
    @objc var replyCount : Int = 0
    @objc var title : String = ""
    @objc var source : String = ""
    @objc var imgsrc : String = ""
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
