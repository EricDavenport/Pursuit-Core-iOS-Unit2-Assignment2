//
//  GoTCellTableViewCell.swift
//  GameOfThrones
//
//  Created by Eric Davenport on 11/18/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UpperTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topCellImage: UIImageView!
    @IBOutlet weak var topCellTitle: UILabel!
    @IBOutlet weak var topCellEpisode: UILabel!

    
  
    
    func configureUpperCell(for episode: GOTEpisode) {
        topCellTitle.text = episode.name
        topCellImage.image = UIImage(named: episode.originalImageID)
        topCellEpisode.text = "S:\(episode.season) E:\(episode.number)"

    }

}
