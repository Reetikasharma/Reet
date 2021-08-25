//
//  ProfileInfoTableViewCell.swift
//  DemoTest
//
//  Created by Reetika Sharma on 23/08/21.
//

import UIKit
import SDWebImage
class ProfileInfoTableViewCell: UITableViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var lblCrown: UILabel!
    @IBOutlet weak var imgCrown: UIImageView!
    @IBOutlet weak var lblDiamond: UILabel!
    @IBOutlet weak var imgDiamond: UIImageView!
    @IBOutlet weak var lblStar: UILabel!
    @IBOutlet weak var imgStar: UIImageView!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    //MARK:VARIABLES
    var service = NetworkService()
    
    //MARK:FUNCTIONS
    func configureCell (userProfileData: UserQueryData) {
        lblName.text = userProfileData.first_name
        self.imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.imgView.sd_setImage(with: URL(string: userProfileData.profile_picture), placeholderImage: UIImage(named: "placeholder"))
        addAttributedtexttolabel(name:userProfileData.first_name,followers:userProfileData.total_followers)
        setTagsData(userProfileData: userProfileData)
    }
    
    func setTagsData(userProfileData: UserQueryData) {
        let usertags = userProfileData.followings.user_tags
        let tag =  usertags.map{$0.tag}
        lblStar.text = tag[0].name
        lblCrown.text = tag[1].name
        lblDiamond.text = tag[3].name
        self.imgStar.sd_setImage(with: URL(string: tag[0].icon), placeholderImage: UIImage(named: "placeholder"))
        self.imgCrown.sd_setImage(with: URL(string: tag[1].icon), placeholderImage: UIImage(named: "placeholder"))
        self.imgDiamond.sd_setImage(with: URL(string: tag[3].icon), placeholderImage: UIImage(named: "placeholder"))
    }
    
    func addAttributedtexttolabel(name:String,followers:Int) {
        let allStr = "@\(name) .\(followers) followers"
        let subStr = ".\(followers)"
        let newStr = NSMutableAttributedString(string: allStr)
        newStr.addAttribute(NSAttributedString.Key.font, value:  UIFont.boldSystemFont(ofSize: 12), range: (allStr as NSString).range(of: subStr))
        self.lblFollowers.attributedText = newStr
    }
}
