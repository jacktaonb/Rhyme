//
//  LearnViewController.swift
//  Rhyme
//
//  Created by 王韬 on 2020/11/26.
//

import UIKit

class LearnViewController: UIViewController {
    
    var collectionData:[information] = [information(name: "零基础学状语", photo: "壮族-一家"),information(name: "从古至今说状语", photo:"壮族-动漫")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarItem.image = UIImage(named: "1")
        tabBarItem.title = "学习"
        configUI()
    }
    
    
    lazy var classifivi:UIView = {
       let vi = UIView(frame: CGRect(x: 5, y: 675, width: self.view.bounds.width-10, height: 150))
        vi.backgroundColor = .clear
        vi.layer.borderColor = .init(red: 4/255, green: 142/255, blue: 252/255, alpha: 0.5)
        vi.layer.borderWidth = 2
        vi.layer.cornerRadius = 20
        return vi
    }()
    
    lazy var tableview:UITableView = {
        let table = UITableView(frame: CGRect(x: 33, y: 10, width: self.view.bounds.width-80, height: 125), style: .plain)
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = true
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .singleLine
        table.separatorColor = UIColor.init(red: 4/255, green: 142/255, blue: 252/255, alpha: 1)
        table.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        table.register(LearnTableViewCell.classForCoder(), forCellReuseIdentifier: "reusedcell")
        return table
    }()
    
    lazy var backgroundVidw: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "学习概况")
        label.numberOfLines = 0
        label.font = UIFont.init(name: "PingFang SC", size: 26)
        return label
    }()
    
    lazy var midTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFang SC", size: 26)
        return label
    }()
    
    lazy var bottomTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFang SC", size: 26)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ab")
        
        return image
    }()

    lazy var recentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(RecentCell.classForCoder(), forCellWithReuseIdentifier: "recentCell")
        return collectionView
    }()
    
    func configUI(){
        self.view.addSubview(topTitleLabel)
        topTitleLabel.text = "学习概况"
        topTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(104)
            make.left.equalToSuperview().offset(5)
        }
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints{ make in
            make.top.equalTo(topTitleLabel.snp.bottom).offset(12.5)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
        
        self.view.addSubview(midTitleLabel)
        midTitleLabel.text = "最近在学"
        midTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(topTitleLabel.snp.bottom).offset(230)
            make.left.equalToSuperview().offset(5)
        }
        
        self.view.addSubview(backgroundVidw)
        backgroundVidw.snp.makeConstraints { make in
            make.top.equalTo(midTitleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(230)
            make.width.equalTo(420)
        }
        backgroundVidw.addSubview(recentCollectionView)
        recentCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(5)
            make.height.equalTo(210)
            make.width.equalTo(400)
        }
        
        
        self.view.addSubview(bottomTitleLabel)
        bottomTitleLabel.text = "学习记录"
        bottomTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(midTitleLabel.snp.bottom).offset(226)
            make.left.equalToSuperview().offset(5)
        }
        classifivi.addSubview(tableview)
        self.view.addSubview(classifivi)
    }
}

extension LearnViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recentCollectionView.dequeueReusableCell(withReuseIdentifier: "recentCell", for: indexPath) as! RecentCell
        cell.contentLabel.text = collectionData[indexPath.row].name
        cell.rightImage.image = UIImage(named: collectionData[indexPath.row].photo)
        cell.layer.cornerRadius = 20
        cell.layer.shadowColor = UIColor(red: 0.02, green: 0.49, blue: 0.99, alpha: 1).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 1
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = .init(red: 4/255, green: 142/255, blue: 252/255, alpha: 1)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 399, height: 85)
    }
}










class RecentCell: UICollectionViewCell {
    lazy var rightImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 17
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PingFang SC", size: 16)
        return label
    }()

    lazy var starImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "star")
        return image
    }()

    var base: CGFloat = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        contentView.addSubview(rightImage)
        rightImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10.67)
            make.width.equalTo(70)
            make.height.equalTo(60)
        }
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8.33)
            make.left.equalTo(self.rightImage.snp.right).offset(10.33)
            
        }
        for _ in 0 ..< 5 {
            contentView.addSubview(starImage)
            starImage.snp.makeConstraints { make in
                make.top.equalTo(self.contentLabel.snp.bottom).offset(2.6)
                make.left.equalTo(self.rightImage.snp.right).offset(10.3 + base)
                make.width.equalTo(20)
                make.height.equalTo(20)
            }
            base = base + 2
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension LearnViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "reusedcell", for: indexPath) as! LearnTableViewCell
        if(indexPath.row == 0)
        {
            cell.photo.image = UIImage(named: "l1")
        }
        if(indexPath.row == 1)
        {
            cell.photo.image = UIImage(named: "l2")
        }
        if(indexPath.row == 2)
        {
            cell.photo.image = UIImage(named: "l3")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
