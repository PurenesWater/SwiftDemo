//
//  HomeMainViewController.swift
//  SwiftStatue
//
//  Created by 凌志 on 2020/7/14.
//  Copyright © 2020 凌志. All rights reserved.
//

import UIKit

class HomeMainViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate  {
    
    let cellIdent = "cellDic"
    
    var dataListArray:[String ] = []
    
    var tableHeadViews:HomeHeadView?
    
    
    var headView = UIView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.white
        
        let tableView = UITableView.init(frame:CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 49) , style: UITableView.Style.plain)
        tableView.tableFooterView = UIView.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
//      tableView.separatorStyle =  UITableViewCell.SeparatorStyle.none
        tableView.separatorColor = UIColor.gray
        
        tableHeadViews = HomeHeadView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 300))
        tableView.tableHeaderView = tableHeadViews
        
        dataListArray = ["这是张三" , "这是李四" ,"真是王五" ,"这是宋六" , "这是王三" ,"我是老板"]
        
        self.view.addSubview(tableView)
        
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        var cell  = tableView.dequeueReusableCell(withIdentifier: cellIdent)
        
        if cell == nil {
            
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellIdent)
        }
        
        let row = indexPath.row
        cell?.textLabel?.text = dataListArray[indexPath.row]
        cell?.detailTextLabel?.text  =  "这个是第\(row)行"
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("点击\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {

        if indexPath.row == 1 {
            return UITableViewCell.EditingStyle.delete
        }
           return  UITableViewCell.EditingStyle.none
    }
    
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        dataListArray.remove(at: indexPath.row)
        dataListArray = ["张三:删除了谁" ,"真是王五:谁被删除了" ,"宋六:不知道啊" , "王三:可能是李四" ,"老板:李四被开了"]
        
//        let  index = IndexPath.init(item: 1, section: 0)
//        tableView.reloadRows(at: [index], with: UITableView.RowAnimation.none)
      
        tableView.reloadData()
        
        tableHeadViews?.nickName?.text = "我把标题换了"
        
        print("删除了\(indexPath.row)")
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
   
  
}

