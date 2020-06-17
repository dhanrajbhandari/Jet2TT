//
//  ViewController.swift
//  Jet2TT
//
//  Created by Dhanraj Bhandari on 15/06/20.
//  Copyright © 2020 Dhanraj Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var articalListTableView: UITableView!
    
    var articalViewModel = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.articalListTableView.register(UINib.init(nibName: "ArticleTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: AppCellIdentifier.articalCellIdentifier)
        
        articalListTableView.estimatedRowHeight = 400
        articalListTableView.rowHeight = UITableView.automaticDimension
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        loadArticles()
    }

    private func loadArticles()  {
        
        articalViewModel.featchArticles(tableView: self.articalListTableView) { [weak self] result in
            
            DispatchQueue.main.async {
                self?.articalListTableView.tableFooterView = nil
            }
            switch result {
                
            case .failure(let error) :
                print(error.localizedDescription)
                let alertVC = UIAlertController.init(title: "Warning", message: error.localizedDescription, preferredStyle: .alert)
                alertVC.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { alert in
                    self?.dismiss(animated: true, completion: nil)
                }))
                
                self?.present(alertVC, animated: true, completion: nil)
            case.success:
                DispatchQueue.main.async {
                    self?.articalListTableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  articalViewModel.articales.count > 0 ? articalViewModel.articales.count + 1 : articalViewModel.articales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: AppCellIdentifier.articalCellIdentifier, for: indexPath) as? ArticleTableViewCell {
                
                articalViewModel.configureArticalCellView(atIndex: indexPath.row, cell: cell)
                
                if indexPath.row == articalViewModel.articales.count - 1 {
                    loadArticles()
                }
                return cell
            }
    
        
        return UITableViewCell()
    }
    
}
