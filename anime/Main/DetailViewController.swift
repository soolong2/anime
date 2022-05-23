//
//  DetailViewController.swift
//  anime
//
//  Created by so on 2022/05/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var taitleLavel: UILabel!
    @IBOutlet weak var detailLable: UILabel!
    
    var model : AnimeData?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taitleLavel.text = model?.attributes.canonicalTitle
        detailLable.text = model?.attributes.synopsis
        if let url = model?.attributes.coverImage?.large,
           let imageUrl = URL(string: url) {
            Nuke.loadImage(with: imageUrl, into: imageview)
        }
    }
}
