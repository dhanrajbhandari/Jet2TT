//
//  Theme.swift
//  Jet2TT
//
//  Created by Dhanraj Bhandari on 16/06/20.
//  Copyright © 2020 Dhanraj Bhandari. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    class func appViewBackgroundColor() -> UIColor{
        return UIColor.init(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1.0)
    }
    class func appUserNameTextColor() -> UIColor{
        return UIColor.black

    }
    class func appUserDesignationTextColor() -> UIColor{
        return UIColor.black

    }
    class func appTimeTextColor() -> UIColor{
        return UIColor.black

    }
    class func appArticleContentTextColor() -> UIColor{
        return UIColor.darkGray

    }
    class func appArticleTitleTextColor() -> UIColor{
        return UIColor.darkGray

    }
    class func appArticleURLTextColor() -> UIColor{
        return UIColor.blue

    }
    class func appArticlelikeCountTextColor() -> UIColor{
        return UIColor.black

    }
    class func appArticleCommentCountTextColor() -> UIColor{
        return UIColor.black

    }
    class func appArticleSeperatorColor() -> UIColor{
        return UIColor.darkGray

    }
    class func appUIControlBorderColor() -> UIColor{
        
        return UIColor.gray
    }
    
}

extension UIFont {
    
    class func appFont(size: CGFloat, weight:UIFont.Weight ) -> UIFont{
        
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}
