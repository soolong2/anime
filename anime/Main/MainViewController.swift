//
//  MainViewController.swift
//  anime
//
//  Created by so on 2022/05/13.
//

import UIKit
import Nuke

class MainViewController: UIViewController {
    let animeTitles: [String] = ["전생슬", "그랑죠", "원피스", "소아온", "귀칼", "나루토", "나의 히어로 아카데미"]
}

extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeTrendingTableViewCell", for: indexPath) as? AnimeTrendingTableViewCell,
                let url = URL(string: "https://picsum.photos/200/30\(indexPath.row)") else {
            return UITableViewCell()
        }
        Nuke.loadImage(with: url, into: cell.animePosterImageView)
        cell.animeTaitleLabel.text = animeTitles[indexPath.row]
        cell.animeSenosisLabel.text = "이건 애니매시연안기다요 호야 호호호야 현중주주주중 아아아아니니나다다와"
    
        return cell
    }
    
    
}
