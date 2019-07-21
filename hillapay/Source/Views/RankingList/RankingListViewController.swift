//
//  RankingListViewController.swift
//  hillapay
//
//  Created by Mahdi on 7/16/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class RankingListViewController: UIViewController {
    
    let accountHandler = AccountHandler.shared
    var ranks = [Rank]()
    
    @IBOutlet weak var tableview        : UITableView!
    @IBOutlet weak var activityview     : UIActivityIndicatorView!
    @IBOutlet weak var noDataView       : UIView!
    @IBOutlet weak var noDataImageView  : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        
        self.navigationItem.title = Strings.ranking
        
        noDataImageView.image = noDataImageView.image?.withRenderingMode(.alwaysTemplate)
        noDataImageView.tintColor = UIColor.darkGray
        
        tableview.isHidden  = true
        noDataView.isHidden = true
        activityview.startAnimating()
        
        tableview.register(UINib(nibName: "RankingTableViewCell", bundle: nil), forCellReuseIdentifier: "RankingTableViewCell")
        tableview.dataSource = self
        tableview.delegate   = self
        
        accountHandler.getRankingList(delegate: self)
    }
    
    @IBAction func plusRanking(_ sender: Any) {
        
        let vc = CheckReportsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


extension RankingListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "RankingTableViewCell") as! RankingTableViewCell
        cell.config(rank: ranks[indexPath.row], delegate: self)
        return cell
    }
    
}

extension RankingListViewController: AccountHandlerDelegate {
    
    func getRankingListSuccessfully(ranks: [Rank]) {
        
        if ranks.count > 0 {
            self.ranks = ranks
            tableview.reloadData()
            tableview.isHidden = false
            activityview.stopAnimating()
        } else {
            tableview.isHidden  = true
            noDataView.isHidden = false
            
        }
        activityview.stopAnimating()
    }
    
    func getRankingListFailed() {
        print("getRankingListFailed")
        
        noDataView.isHidden = false
    }
}


extension RankingListViewController: RankingTableViewCellDelegate {
    
    
    func OpenRankingResult(url: String) {
        
        guard let web = URL(string: url) else { return }
        UIApplication.shared.open(web)
    }
    
}
