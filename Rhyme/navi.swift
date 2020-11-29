//
//  navi.swift
//  Rhyme
//
//  Created by 樊鸣远 on 2020/11/29.
//

import UIKit

class navi: UIView {
    
    lazy var label:UILabel = {
        let label = UILabel(frame: CGRect(x: 190, y: 40, width: 80, height: 44))
        label.font = UIFont(name: "PingFang SC", size: 25)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        self.backgroundColor = UIColor(red: 227/255.0, green: 242/255.0, blue: 255/255.0, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
