//
//  MainViewController.swift
//  anime
//
//  Created by so on 2022/05/13.
//

import UIKit
import Nuke
import Alamofire

struct AnimePosterImage: Codable {
    let tiny: String
    let large: String
    let small: String
    let medium: String
    let original: String
}

struct AnimeAttribytes: Codable {
    let synopsis: String
    let canonicalTitle: String
    let posterImage: AnimePosterImage
}

struct AnimeData: Codable {
    let id: String
    let type: String
    let attributes: AnimeAttribytes
}

struct AnimeModel: Codable {
    let data: [AnimeData]
}



class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var modal: AnimeModel?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        AF.request("https://kitsu.io/api/edge/anime").response { response in
            guard let data = response.data else {
                return
            }
            let model = try! JSONDecoder().decode(AnimeModel.self, from: data)
            self.modal = model
            self.tableView.reloadData()
        }
        
    }
}

extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modal?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeTrendingTableViewCell", for: indexPath) as? AnimeTrendingTableViewCell,
              let data = modal?.data[indexPath.row],
              let url = URL(string: data.attributes.posterImage.medium) else {
            return UITableViewCell()
        }
        
        Nuke.loadImage(with: url, into: cell.animePosterImageView)
        cell.animeTaitleLabel.text = data.attributes.canonicalTitle
        cell.animeSenosisLabel.text = data.attributes.synopsis
        
        return cell
    }
    
    
}
