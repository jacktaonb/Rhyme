//
//  MineViewController.swift
//  Rhyme
//
//  Created by 王韬 on 2020/11/26.
//

import UIKit
import SnapKit


let InformationTableViewCellID = "InformationTableViewCell"
let BodyTableViewCellID = "BodyTableViewCell"

class MineViewController: UIViewController {

    
    var InformationData = InformationModel()
    var bodyDatas1 = [MineModel]()
    var bodyDatas2 = [MineModel]()
    var bodyDatas3 = [MineModel]()
    
    lazy var tableview: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(BodyTableViewCell.self, forCellReuseIdentifier: BodyTableViewCellID)
        tableview.register(InformationTableViewCell.self, forCellReuseIdentifier: InformationTableViewCellID)
        tableview.separatorStyle = .none
        tableview.backgroundColor = .clear
        tableview.showsVerticalScrollIndicator = false
        tableview.isScrollEnabled = false
        
        return tableview
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.tabBarItem.image = UIImage(named: "1")
        self.tabBarItem.title = "个人"
        
        //UINavigationController的相关设置
        self.navigationItem.title = "个人"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 227/255.0, green: 242/255.0, blue: 255/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.layer.shadowColor = UIColor(red: 227/255.0, green: 242/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.7
        
        
        self.view.addSubview(tableview)
        configData()
        tableview.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(-27)
            make.bottom.equalToSuperview().offset(0)
        }
        
        
    }
    

    func configData(){
        let data = InformationModel(img: "头像", username:"七十一", id:"ID: 1579188215")
        self.InformationData = data
        
        self.bodyDatas1.append(MineModel(leftIcon: "studyx1", titleText: "我的学习"))
        self.bodyDatas1.append(MineModel(leftIcon: "collectionx1", titleText: "我的收藏"))
        
        
        self.bodyDatas2.append(MineModel(leftIcon: "helpx1", titleText: "帮助中心"))
        self.bodyDatas2.append(MineModel(leftIcon: "opinion-ox1", titleText: "意见反馈"))
        self.bodyDatas2.append(MineModel(leftIcon: "Evaluationx1", titleText: "你的评价"))
        
        self.bodyDatas3.append(MineModel(leftIcon: "setx1", titleText: "设置"))
    }

    
}

extension MineViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }else if section == 2 {
            return 3
        }
        else if section == 3{
            return 1
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCellID, for: indexPath) as! InformationTableViewCell
            cell.updateUI(with: self.InformationData)
//            cell.layer.borderWidth = 0.1
//            cell.layer.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1.0).cgColor
            cell.layer.cornerRadius = 10
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: BodyTableViewCellID, for: indexPath) as! BodyTableViewCell
        if indexPath.section == 1 {
            cell.updateUI(with: bodyDatas1[indexPath.row])
        }else if indexPath.section == 2{
            cell.updateUI(with: bodyDatas2[indexPath.row])
        }
        else if indexPath.section == 3{
            cell.updateUI(with: bodyDatas3[indexPath.row])
        }
//        cell.layer.borderWidth = 0.1
//        cell.layer.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1.0).cgColor
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 50

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vi = UIView()
        vi.backgroundColor  = .clear
        return vi
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 17
    }
    
    


}
