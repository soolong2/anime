//
//  MangGaViewController.swift
//  anime
//
//  Created by so on 2022/05/19.
//

import UIKit
import Alamofire
import Nuke

class MangGaViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var modal: AnimeModel?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        //AF통신
        AF.request("https://kitsu.io/api/edge/manga").response { response in
            guard let data = response.data else {
                return
            }
            let model = try! JSONDecoder().decode(AnimeModel.self, from: data)
            self.modal = model
            self.tableView.reloadData()
        }
        
    }
    
    
    // Do any additional setup after loading the view.
}
extension MangGaViewController: UITableViewDataSource, UITableViewDelegate {
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
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == (modal?.data.count ?? 0) - 1
                , let url = modal?.links.next else {return}
        AF.request(url).response { response in
            guard let data = response.data else {
                return
            }
            let model = try! JSONDecoder().decode(AnimeModel.self, from: data)
            self.modal?.data.append(contentsOf: model.data)
            self.modal?.links = model.links
            self.tableView.reloadData()
        }
    }
    
    
    
}

