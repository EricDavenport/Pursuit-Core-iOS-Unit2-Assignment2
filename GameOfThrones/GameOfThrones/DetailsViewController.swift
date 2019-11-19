//
//  DetailsViewController.swift
//  GameOfThrones
//
//  Created by Eric Davenport on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var largePhotoImage: UIImageView!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    func updateUI() {
           guard let theEpisode = episode else {
               fatalError("Couldn't get the episode, verify the perpare(for segue: )")
           }
        title = episode?.name
        
        largePhotoImage.image = UIImage(named: episode!.mediumImageID)
        seasonLabel.text = episode?.season.description
        summaryLabel.text = episode?.summary.description
        runtimeLabel.text = episode?.runtime.description
        airDateLabel.text = episode?.airdate.description
        episodeLabel.text = episode?.number.description
    
    

}
}
