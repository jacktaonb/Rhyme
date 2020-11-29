//
//  HomeChildCollectionViewCell.swift
//  Rhyme
//
//  Created by 樊鸣远 on 2020/11/27.
//

import UIKit

class HomeChildCollectionViewCell: UICollectionViewCell {
    
    lazy var name:UILabel = {
       let label = UILabel(frame: CGRect(x: 5, y: 85, width: 80, height: 25))
        return label
    }()
    
    
    lazy var photo:UIImageView = {
       let imageview = UIImageView(frame: CGRect(x: 13, y: 10, width: 50, height: 50))
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 4/255, green: 142/255, blue: 252/255, alpha: 0.5)
        addSubview(name)
        self.addSubview(photo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
