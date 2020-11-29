//
//  HomeChildTableViewCell.swift
//  Rhyme
//
//  Created by 樊鸣远 on 2020/11/28.
//

import UIKit

class HomeChildTableViewCell: UITableViewCell {
    
    
    lazy var name:UILabel = {
       let label = UILabel(frame: CGRect(x: 90, y: 30, width: 300, height: 25))
        return label
    }()
    
    
    lazy var photo:UIImageView = {
       let imageview = UIImageView(frame: CGRect(x: 10, y: 10, width: 66, height: 66))
        imageview.layer.cornerRadius = 15
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    
    override func layoutSubviews() {
        self.addSubview(name)
        self.addSubview(photo)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
