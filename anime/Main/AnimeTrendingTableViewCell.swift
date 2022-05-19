//
//  AnimeTrendingTableViewCell.swift
//  anime
//
//  Created by so on 2022/05/13.
//

import UIKit

class AnimeTrendingTableViewCell: UITableViewCell {

    @IBOutlet weak var animePosterImageView: UIImageView!
    
    @IBOutlet weak var animeTaitleLabel: UILabel!
    
    @IBOutlet weak var animeSenosisLabel: UILabel!
    override  func awakeFromNib() {
        super.awakeFromNib()
        animePosterImageView.layer.cornerRadius = 15
        animePosterImageView.layer.borderColor =  UIColor.red
            .cgColor
        animePosterImageView.layer.borderWidth = 2
    }
}

