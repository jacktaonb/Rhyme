//
//  BodyTableViewCell.swift
//  Rhyme
//
//  Created by mac bookPro on 2020/11/29.
//

import UIKit
import SnapKit

class BodyTableViewCell: UITableViewCell {

    public func updateUI(with data: MineModel) {
        self.titleLabel.text = data.titleText
        self.leftIcon.image  = UIImage(named: data.leftIcon)
    }
    
    // 用户名
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.text = ""
//        label.textColor = UIColor.black
        label.alpha = 0.7
        return label
    }()
    
    
    lazy var rightIcon:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow-right"))
        imageView.alpha = 0.7
        return imageView
     }()
    
    lazy var leftIcon:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 17, y: 14, width: 25, height: 25))
        return imageView
     }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(62)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        contentView.addSubview(rightIcon)
        rightIcon.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-25)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        contentView.addSubview(leftIcon)
    }

}
