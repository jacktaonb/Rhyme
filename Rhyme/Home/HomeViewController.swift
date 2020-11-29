//
//  HomeViewController.swift
//  Rhyme
//
//  Created by 王韬 on 2020/11/26.
//

import UIKit
import SnapKit
import ESTabBarController_swift
import EachNavigationBar

public struct information {
    var name:String
    var photo:String
}

class HomeViewController: UIViewController, ConstraintRelatableTarget{
    

    var collectiondata:[information] = [information(name: "主要区域", photo: "area-map"),information(name: "历史演变", photo: "history"),information(name: "文字演变", photo: "language的副本"),information(name: "日常用语", photo: "daily"),information(name: "  资料库", photo: "data"),information(name: "    其他", photo: "more")]
    
    var tableviewdata:[information] = [information(name: "华北东北次方言（陕西的北方语）", photo: "北方-秋"),information(name: "西北次方言（西北官话）", photo: "西北"),information(name: "西南次方言（西南官话）", photo: "梯田"),information(name: "江淮次方言（下江官话）", photo: "苏州园林-桥")]
    
    
    lazy var searchView: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.init(red: 240, green: 240, blue: 240,alpha: 1)
        vi.layer.cornerRadius = 20
        vi.layer.borderWidth = 2
        vi.layer.borderColor = .init(red: 4/255, green: 142/255, blue: 252/255, alpha: 0.5)
        vi.layer.masksToBounds = true
        return vi
    }()
    
    lazy var searchBarBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textAlignment = .left
        return btn
    }()
    
    // 标题
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.text = "搜索"
        return label
    }()
    
    // 左部搜索ImageView
    lazy var searchImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "search"))
        return imageView
    }()
    
    lazy var photoBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "microphone"), for: .normal)
        return btn
    }()
    
    
    lazy var vi:UIView = {
        let vi = UIView(frame: CGRect(x: 5, y: 405, width: self.view.bounds.width-10, height: 200))
        vi.backgroundColor = .clear
        vi.layer.borderColor = .init(red: 4/255, green: 142/255, blue: 252/255, alpha: 0.5)
        vi.layer.borderWidth = 2
        vi.layer.cornerRadius = 20
        return vi
    }()
    
    lazy var hot:UILabel = {
       let label = UILabel(frame: CGRect(x: 45, y: 15, width: 150, height: 20))
        label.text = "热门方言"
        label.font = UIFont.init(name: "PingFang SC", size: 20)
        label.tintColor = .black
        return label
    }()
    
    lazy var fire:UIImageView = {
       let imageview = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        imageview.image = UIImage(named: "popular_fill")
        return imageview
    }()
    
    lazy var more:UILabel = {
        let label = UILabel(frame: CGRect(x: 342, y: 15, width: 35, height: 22))
        label.text = "更多"
        label.font = UIFont.init(name: "PingFang SC", size: 16)
        label.textColor = .black
        label.alpha = 1
        return label
    }()
    
    lazy var moreimage:UIImageView = {
       let imageview = UIImageView(frame: CGRect(x: 377, y: 18, width: 16, height: 16))
        imageview.image = UIImage(named: "more (2)")
        return imageview
    }()
    
    lazy var classifivi:UIView = {
       let vi = UIView(frame: CGRect(x: 5, y: 615, width: self.view.bounds.width-10, height: 220))
        vi.backgroundColor = .clear
        vi.layer.borderColor = .init(red: 4/255, green: 142/255, blue: 252/255, alpha: 0.5)
        vi.layer.borderWidth = 2
        vi.layer.cornerRadius = 20
        return vi
    }()
    
    lazy var classfilabel:UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 15, width: 150, height: 20))
         label.text = "分类"
         label.font = UIFont.init(name: "PingFang SC", size: 20)
         label.tintColor = .black
         return label
    }()
    
    lazy var classfiimage:UIImageView = {
        let imageview = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
         imageview.image = UIImage(named: "financial_classification")
         return imageview
    }()
    
    lazy var tableview:UITableView = {
        let table = UITableView(frame: CGRect(x: 10, y: 50, width: self.view.bounds.width-20, height: 160), style: .plain)
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = true
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .singleLine
        table.separatorColor = UIColor.init(red: 4/255, green: 142/255, blue: 252/255, alpha: 1)
        table.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        table.register(HomeChildTableViewCell.classForCoder(), forCellReuseIdentifier: "reusedcell")
        return table
    }()
    
    lazy var label:UILabel = {
        let label = UILabel(frame: CGRect(x: 13, y: -15, width: self.view.bounds.width-40, height: 270))
        label.text = """
泼烦的--麻烦的，不开心的；
加儿，mie儿，且儿--今天，明天，前天（回族土话）；
走那尼克尼--上哪去；
日厌死了--讨厌到极点；
把言嗤--不要说话；
好是嗲--是这样吗？
"""
        label.font = UIFont.init(name: "PingFang SC", size: 15)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var collection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collect = UICollectionView(frame: CGRect(x: 20, y: 145, width: self.view.bounds.width-40, height: 270), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collect.delegate = self
        collect.dataSource = self
        collect.showsVerticalScrollIndicator = false
        collect.isScrollEnabled = false
        collect.backgroundColor = .white
        collect.register(HomeChildCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "reusedcell")
        return collect
    }()
    
    lazy var naviga:navi = {
        let view = navi(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 88))
        view.label.text = "首页"
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBarItem.image = UIImage(named: "1")
        self.tabBarItem.title = "首页"
        self.view.addSubview(collection)
        
        self.view.addSubview(naviga)
        
        vi.addSubview(label)
        vi.addSubview(hot)
        vi.addSubview(fire)
        vi.addSubview(more)
        vi.addSubview(moreimage)
        self.view.addSubview(vi)
        
        classifivi.addSubview(tableview)
        classifivi.addSubview(classfilabel)
        classifivi.addSubview(classfiimage)
        self.view.addSubview(classifivi)
        
        searchView.addSubview(searchImageView)
        searchView.addSubview(titleLabel)
        searchView.addSubview(searchBarBtn)
        searchView.addSubview(photoBtn)
        self.view.addSubview(searchView)
        
        searchView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(95)
            make.height.equalTo(40)
        }

        searchImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }

        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }

        searchBarBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(70)
            make.right.equalToSuperview().offset(-90)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(30)
        }

        photoBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.width.height.equalTo(30)
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "reusedcell", for: indexPath) as! HomeChildCollectionViewCell
            cell.name.text = collectiondata[indexPath.row].name
            cell.photo.image = UIImage(named: collectiondata[indexPath.row].photo)
            cell.layer.cornerRadius = 37.5
            return cell
        }
    }


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "reusedcell", for: indexPath) as! HomeChildTableViewCell
        cell.name.text = tableviewdata[indexPath.row].name
        cell.photo.image = UIImage(named: tableviewdata[indexPath.row].photo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
}
