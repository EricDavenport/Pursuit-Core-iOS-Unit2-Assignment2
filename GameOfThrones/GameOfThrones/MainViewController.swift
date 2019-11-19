//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var seasons = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.delegate = self
        seasons = GOTEpisode.getSeason()
        dump(seasons)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                return
        }
        
        detailsVC.episode = seasons[indexPath.section][indexPath.row]
    }
    
    
    
}

extension MainViewController: UITableViewDataSource {
    // numberOrRowInSection
    // cellForRowAt     cell = tableView.DequeueREusableCell(...)
    // numberOfSections()
    // titleForHeaderInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let lowerCell = tableView.dequeueReusableCell(withIdentifier: "lowerCell", for: indexPath) as? LowerTableViewCell else {
            fatalError("lowerCell failed to deque")
        }
        
        guard let upperCell = tableView.dequeueReusableCell(withIdentifier: "upperCell", for: indexPath) as? UpperTableViewCell else {
            fatalError("upperCell failed to deque")
        }
        
        
        let thisEpisode = seasons[indexPath.section][indexPath.row]
        
        if thisEpisode.season % 2 == 0{
            lowerCell.configureLowerCell(for: thisEpisode)
            return lowerCell
        } else{
            upperCell.configureUpperCell(for: thisEpisode)
            return upperCell
        }
}
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Season \(seasons[section].first!.season)"
}
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
