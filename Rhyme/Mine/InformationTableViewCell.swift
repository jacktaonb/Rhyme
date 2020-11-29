//
//  InformationTableViewCell.swift
//  Rhyme
//
//  Created by mac bookPro on 2020/11/29.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    
    func updateUI(with data: InformationModel) {
        self.userImg.image = UIImage(named: data.img)
        self.userName.text = data.username
        
    }

    lazy var userImg: UIImageView = {
       let vi = UIImageView(frame: CGRect(x: 13, y: 10, width: 80, height: 80))
        vi.layer.cornerRadius = 0
        vi.layer.masksToBounds = true
        vi.image = UIImage(named: "头像")
        vi.contentMode = .scaleAspectFill
        return vi
    }()
    
    lazy var userName: UILabel = {
       let label = UILabel(frame: CGRect(x: 116, y: 15, width: 89, height: 33))
        label.text = ""
        label.textColor = UIColor.black
        label.font = UIFont.init(name: "PingFangSC-Semibold", size: 24)
        return label
    }()
    
    
    lazy var id: UILabel = {
       let label = UILabel(frame: CGRect(x: 116, y: 55, width: 145, height: 22))
        label.text = "ID: 1579188215"
        label.font = UIFont.init(name: "PingFangSC-Semibold", size: 16)
        label.alpha = 0.5
        return label
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
        self.addSubview(userImg)
        self.addSubview(userName)
        self.addSubview(id)
    }



}
