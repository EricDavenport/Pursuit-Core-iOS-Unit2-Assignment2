//
//  GoTCellTableViewCell.swift
//  GameOfThrones
//
//  Created by Eric Davenport on 11/18/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GoTCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topCellImage: UIImageView!
    @IBOutlet weak var topCellTitle: UILabel!
    @IBOutlet weak var topCellEpisode: UILabel!
    @IBOutlet weak var lowerCellImage: UIImageView!
    @IBOutlet weak var lowerCellTitle: UILabel!
    @IBOutlet weak var lowerCellEpisode: UILabel!
    
    func configureCell(for episode: GOTEpisode) {
        topCellTitle.text = episode.name
        topCellImage.image = UIImage(named: episode.mediumImageID)
        topCellEpisode.text = "S:\(episode.season) E:\(episode.number)"
        lowerCellImage.image = UIImage(named: episode.originalImageID)
        lowerCellTitle.text = episode.name
        lowerCellEpisode.text = "S:\(episode.season) E:\(episode.number)"
    }

}
