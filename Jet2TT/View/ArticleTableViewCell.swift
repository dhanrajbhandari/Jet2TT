//
//  ArticleTableViewCell.swift
//  Jet2TT
//
//  Created by Dhanraj Bhandari on 16/06/20.
//  Copyright © 2020 Dhanraj Bhandari. All rights reserved.
//

import UIKit

protocol CustomTableViewCell {
    
}

class ArticleTableViewCell: UITableViewCell, CustomTableViewCell {

    @IBOutlet weak var containerStackView: UIStackView!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userDesignationLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articalImageViewHeightConstaint: NSLayoutConstraint!
    
    @IBOutlet weak var articleContentLabel: UILabel!
    
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    @IBOutlet weak var articleUrlLabel: UILabel!
    
    
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var commentCountLabel: UILabel!
    
    @IBOutlet weak var articleSeperator: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI(){
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2
        self.userImageView.layer.masksToBounds = true
        self.userImageView.layer.borderWidth = 1
        self.userImageView.layer.borderColor = UIColor.appUIControlBorderColor().cgColor
        
        self.userNameLabel.textColor = .appUserNameTextColor()
        self.userNameLabel.font = .appFont(size: 15.0, weight: .bold)
        
        self.userDesignationLabel.textColor = .appUserDesignationTextColor()
        self.userDesignationLabel.font = .appFont(size: 14.0, weight: .light)
        
        self.timeLabel.textColor = .appUserDesignationTextColor()
        self.timeLabel.font = .appFont(size: 13.0, weight: .light)
         
        self.articleImageView.layer.borderWidth = 1
        self.articleImageView.layer.borderColor = UIColor.appUIControlBorderColor().cgColor
        
        self.articleContentLabel.textColor = .appArticleContentTextColor()
        self.articleContentLabel.font = .appFont(size: 14.0, weight: .medium)
        
        self.articleTitleLabel.textColor = .appArticleTitleTextColor()
        self.articleTitleLabel.font = .appFont(size: 14.0, weight: .medium)
        
        self.articleUrlLabel.textColor = .appArticleURLTextColor()
        self.articleUrlLabel.font = .appFont(size: 13.0, weight: .light)
     
        self.likeCountLabel.textColor = .appArticlelikeCountTextColor()
        self.likeCountLabel.font = .appFont(size: 14.0, weight: .bold)
        
        self.commentCountLabel.textColor = .appArticleCommentCountTextColor()
        self.commentCountLabel.font = .appFont(size: 14.0, weight: .bold)
        
        self.articleSeperator.backgroundColor = .appArticleSeperatorColor()
    }
    
    //Need to reset value for avoid show previous cell value in next cell
    func resetUIValues()  {
        
        self.userImageView.image = nil
        self.userNameLabel.text = ""
        self.userDesignationLabel.text = ""
        self.timeLabel.text = ""
        self.articleContentLabel.text = ""
        self.articleUrlLabel.text = ""
        self.articleTitleLabel.text = ""
        self.likeCountLabel.text = ""
        self.commentCountLabel.text = ""
        
        
    }
}


