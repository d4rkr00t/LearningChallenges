//
//  ColourGroupsListTableViewController.swift
//  MaterialColourPalette
//
//  Created by Stanislav Sysoev on 2/28/17.
//  Copyright © 2017 Stanislav Sysoev. All rights reserved.
//

import UIKit

class ColourGroupsListTableViewController: UITableViewController {
    var atTop: Bool = true
    var atBottom: Bool = false
    var backgroundSet: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)

        if !backgroundSet {
            tableView.backgroundColor = getFirstGroupMainColour()
            backgroundSet = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 70 * 2 {
            if !atTop {
                print("set top bg");
                atTop = true
                atBottom = false
                tableView.backgroundColor = getFirstGroupMainColour()
            }
        } else {
            if !atBottom {
                print("set bottom bg");
                atTop = false
                atBottom = true
                tableView.backgroundColor = getLastGroupMainColour()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return getMaterialColourGroups().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let colourName = MaterialColours(rawValue: indexPath.row)
        let colours = getMaterialColourGroups()[colourName!]
        cell.backgroundColor = colours?[materialColoursMainIndex]
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        let colourName = MaterialColours(rawValue: tableView.indexPathForSelectedRow!.row)
        let colours = getMaterialColourGroups()[colourName!]
        
        if let destination = segue.destination as? SingleColourPaletteTableViewController {
            destination.colours = colours!
            destination.colourGroup = colourName!
        }
    }
}
