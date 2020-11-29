//
//  LearnTableViewCell.swift
//  Rhyme
//
//  Created by 樊鸣远 on 2020/11/29.
//

import UIKit

class LearnTableViewCell: UITableViewCell {
    
    
    lazy var photo:UIImageView = {
        let imageview = UIImageView(frame: CGRect(x: 0, y: 10, width: self.bounds.width, height: 66))
        imageview.layer.cornerRadius = 15
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    
    override func layoutSubviews() {
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
