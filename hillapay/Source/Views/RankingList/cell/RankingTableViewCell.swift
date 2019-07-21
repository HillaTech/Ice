//
//  RankingTableViewCell.swift
//  hillapay
//
//  Created by Mahdi on 7/17/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel  : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var stateLabel : UILabel!
    
    var delegate : RankingTableViewCellDelegate!
    var rank     : Rank!
    
    func config(rank: Rank, delegate: RankingTableViewCellDelegate) {
        
        self.delegate = delegate
        self.rank     = rank
        
        let date = Date.hillDate(date: rank.timestamp!)
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        timeLabel.text  = "\(date.Jalali)   \(hour):\(minutes)"
        priceLabel.text = rank.amount!.priceModel() + " \(Strings.toman)"
        stateLabel.text = rank.status
    }
    
    @IBAction func openRanking(_ sender: Any) {
        
        delegate.OpenRankingResult(url: rank.url ?? "")
    }
    
}


protocol RankingTableViewCellDelegate {
    
    func OpenRankingResult(url: String)
}
