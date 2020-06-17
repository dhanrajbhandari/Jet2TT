//
//  ArticleViewModel.swift
//  Jet2TT
//
//  Created by Dhanraj Bhandari on 16/06/20.
//  Copyright © 2020 Dhanraj Bhandari. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ArticleViewModel {
    
    
    init(articals:[ArticleDataModel]? = nil) {
        if let dataModels = articals {
            self.articales = dataModels
        }
    }
    var articales = [ArticleDataModel](){
        didSet{
            
        }
    }
    var pageCount = 1
    
    func configureArticalCellView(atIndex: Int, cell: ArticleTableViewCell)  {
        let artical =  self.articales[atIndex]
        
        cell.resetUIValues()
        
        if let user = artical.user.first {
            cell.userNameLabel.text = user.name + " " + user.lastname
            cell.userDesignationLabel.text = user.designation
            cell.timeLabel.text = Date.getElapsedInterval(endDateStr: user.createdAt)
            
            if let userImageURL = URL.init(string: user.avatar) {
                cell.userImageView.kf.indicatorType = .activity
                cell.userImageView.kf.setImage(with: userImageURL)
            }
        }
        
        if let articalImageURL = URL.init(string: artical.media.first?.image ?? "") {
            cell.articleImageView.isHidden = false
            cell.articalImageViewHeightConstaint.constant = 250
            cell.articleImageView.kf.indicatorType = .activity
            cell.articleImageView.kf.setImage(with: articalImageURL)
        }else{
            cell.articleImageView.isHidden = true
            cell.articalImageViewHeightConstaint.constant = 0
        }
        cell.articleContentLabel.text = artical.content
        cell.articleTitleLabel.text = artical.media.first?.title
        cell.articleUrlLabel.text = artical.media.first?.url
        cell.likeCountLabel.text = getCountString(count: artical.likes)+" likes"
        cell.commentCountLabel.text = getCountString(count:artical.comments)+" comments"
        
        cell.containerStackView.layoutIfNeeded()

    }
    
    private func getCountString(count: Int) -> String{
        
        if count < 1000 {
            return "\(count)"
        }else {
            return String.init(format: "%.1fK", Double(count)/1000.0)
        }
    }
}

//API Call
extension ArticleViewModel {
    func featchArticles(tableView: UITableView , completion:  @escaping (Result<[ArticleDataModel], Error>) -> Void ) {
        
        let urlString = String.init(format: "\(AppURL.baseURL)\(AppURL.getArticles)",pageCount )
        NetWorkManager.shared.get(urlString: urlString ,completionBlock:  { [weak self] result in
            
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                print ("failure", error)
                completion(.failure(error))
            case .success(let data) :
                let decoder = JSONDecoder()
                do
                {
                    self.articales.append(contentsOf:  try decoder.decode([ArticleDataModel].self, from: data))
                    self.pageCount += 1
                    completion(.success(try decoder.decode([ArticleDataModel].self, from: data)))
                } catch {
                    completion(.failure(error))
                }
            
            }
        })
    
    }
}
