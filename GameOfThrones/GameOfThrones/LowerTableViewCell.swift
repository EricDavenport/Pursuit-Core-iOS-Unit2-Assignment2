//
//  LowerTableViewCell.swift
//  GameOfThrones
//
//  Created by Eric Davenport on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class LowerTableViewCell: UITableViewCell {

  @IBOutlet weak var lowerCellImage: UIImageView!
  @IBOutlet weak var lowerCellTitle: UILabel!
  @IBOutlet weak var lowerCellEpisode: UILabel!
    
    func configureLowerCell(for episode: GOTEpisode) {
        lowerCellImage.image = UIImage(named: "\(episode.originalImageID)")
        lowerCellTitle.text = episode.name
        lowerCellEpisode.text = "S:\(episode.season) E:\(episode.number)"
    }

}
