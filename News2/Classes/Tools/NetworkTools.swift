//
//  NetworkTools.swift
//  News
//
//  Created by 湛伟chun on 2020/2/18.
//  Copyright © 2020 sittone. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

//网络请求工具列
class NetworkTools {

    //类方法 OC+开头, 闭包中_不需要外部的参数
    
    class func requestData(URLString : String, type : MethodType, parameters:[String: Any]? = nil, finishedCallBack : @escaping (_ result:Any)->()){
        let method = type == .get ? HTTPMethod.get: HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            // 校验是否有结果
            guard let result = response.result.value else {
                print(response.result.error)
                return
                
            }
            
            // 有值将结果回调出去
            finishedCallBack(result)
            
        }
        
        
    }
    
    
}
