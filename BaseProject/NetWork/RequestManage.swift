//
//  RequestManage.swift
//  BaseProject
//
//  Created by scott on 16/10/9.
//  Copyright © 2016年 scott. All rights reserved.
//

import UIKit
import AFNetworking
import Alamofire
import SwiftyJSON


class RequestManage {
    
    static let shared = RequestManage()
    
    fileprivate let afManager = AFHTTPSessionManager()
    
    fileprivate var head = [String: String]() //请求头
    
    init() {
        afManager.responseSerializer = AFJSONResponseSerializer()
        afManager.responseSerializer.acceptableContentTypes = NSSet(objects: "text/plain", "text/json", "application/json","text/javascript","text/html", "application/javascript", "text/js") as? Set<String>
        
        afManager.requestSerializer = AFHTTPRequestSerializer()
        afManager.requestSerializer.timeoutInterval = 20 //请求延时
        
        //请求头
        head["Content-Type"] = "application/json"
        
    }
    
    //AFNetworking请求
    func requestAFNetworking(url: String, method: RequestHTTPMethod, encoding: UInt? = String.Encoding.utf8.rawValue, params: [String: AnyObject]?, success: (((JSON) -> Void)?), failure: ((Error) -> Void)?) {
        //编码格式
        afManager.requestSerializer.stringEncoding = encoding!
        //设置请求头
        //afManager.requestSerializer.setValue("", forHTTPHeaderField: "")
        
        //url 转换为 utf8 编码
        //var urlStr = ""
        //urlStr = url.addingPercentEncoding(withAllowedCharacters: encoding!)!
        
        switch method {
        case .Get:
            afManager.get(url, parameters: params, progress: nil, success: { (task, response) -> Void in
                if let data = response as? Data {
                    let json = JSON(data: data)
                    success?(json)
                }
                print("成功 task", task, "成功 返回值", response)
                }, failure: { (task, error) -> Void in
                    failure?(error)
                    print("失败 task", task, "失败 错误", error)
            })
        case .Post:
            afManager.post(url, parameters: params, progress: nil, success: { (task, response) in
                if let data = response as? Data {
                    let json = JSON(data: data)
                    success?(json)
                }
                print("成功 task", task, "成功 返回值", response)
                }, failure: { (task, error) in
                    failure?(error)
                    print("失败 task", task, "失败 错误", error)
            })
        }
    }
    
    //Alamofire请求
    func requestAlamofire(path: String, method: HTTPMethod, parames: [String: AnyObject]? = [:], success: ((JSON) -> ())?, failure: ((Error) -> ())? = nil) {
        var k_path = ""
        k_path = "" + path

        Alamofire.request(k_path, method: method, parameters: parames, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success(let data):
                if let data = data as? Data {
                    let json = JSON(data: data)
                    success?(json)
                }
            case .failure(let error):
                failure?(error)
            }
        }
    }
}







