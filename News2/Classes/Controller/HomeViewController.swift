//
//  HomeViewController.swift
//  News
//
//  Created by 湛伟chun on 2020/2/18.
//  Copyright © 2020 sittone. All rights reserved.
//

import UIKit

//常量
private let kHomeCellId = "kHomeCellId"

class HomeViewController: UIViewController {

    //懒加载数组
    fileprivate lazy var newModels : [NewsMode] = [NewsMode]()
    
    //闭包方式创建tableview
    fileprivate lazy var tableView : UITableView = {[unowned self] in //防止循环引用
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        //注册cell
        tableView.register(UINib(nibName: "NewsViewCell", bundle: nil ), forCellReuseIdentifier: kHomeCellId)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航栏
        setupNavigationBar()
        
        //添加tableview
        view.addSubview(tableView)
        
        //请求网络数据
        loadData()
    }
    
    
    
    
    
}
//mark: -- 设置UI界面
extension HomeViewController{
    fileprivate func setupNavigationBar(){
        //设置背景图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "reader_navigation_background"), for: .default)
        
        //设置标题
        navigationItem.titleView = UIImageView(image: UIImage(named: "navigation_logo"))
        //设置右侧搜索按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigation_search"), style: .plain, target: self, action: #selector(searchItemClick))
    }
}
//mark:-- 事件监听
extension HomeViewController{
    //为了保留oc的特性
    @objc fileprivate func searchItemClick() {
        print("........")
    }
}
//网络请求
extension HomeViewController{
    fileprivate func loadData(){
        NetworkTools.requestData(URLString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get) { (result:  Any ) in
            //print(result)
            guard let resultDict = result as? [String : Any] else {return}
            guard let dataArray = resultDict["T1348649079062"] as? [[String:Any]] else {return}
            for dict in dataArray{
                self.newModels.append(NewsMode(dict:dict))
            }
            //刷新表格
            self.tableView.reloadData()
        }
    }
}
// mark : -- 代理DataSource
extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newModels.count
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellId, for: indexPath) as! NewsViewCell
        cell.newsModel = newModels[indexPath.row]
        //cell.textLabel?.text = .title
        return cell
    }
}
