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
    seasons = GOTEpisode.getSeason()
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
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell  else {   // type cast as? to type expected CountryCell
//              // explicitly crashed the app at runtime if
//              // a CountryCell does not exist, this is a develop error
//              fatalError("Couldn't dequeue a CountryCell")
//          }
//
//          // get the object (country) to set a current indexPath
//          let country = continents[indexPath.section][indexPath.row]
//
//          // configure the cell - with configureCell func from CountryCell.swift file
//          // populates the properties within class
//          cell.configureCell(for: country)
//
//          return cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell1", for: indexPath) as? GoTCellTableViewCell else {
            fatalError("Unable to deque GoTCellTableViewCell")
        }
        
        let singleEpisode = seasons[indexPath.section][indexPath.row]
        cell.configureCell(for: singleEpisode)
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(seasons[section].first?.season)"
    }
}
