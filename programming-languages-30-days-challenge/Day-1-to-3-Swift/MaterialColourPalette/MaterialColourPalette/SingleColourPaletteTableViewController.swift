//
//  SingleColourPaletteTableViewController.swift
//  MaterialColourPalette
//
//  Created by Stanislav Sysoev on 2/28/17.
//  Copyright © 2017 Stanislav Sysoev. All rights reserved.
//

import UIKit

class SingleColourPaletteTableViewController: UITableViewController {
    
    var colours: [UIColor] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellColour", for: indexPath)
        let colour = colours[indexPath.row]
        cell.backgroundColor = colour
        cell.detailTextLabel?.text = colour.toHexString().uppercased()
        cell.textLabel?.text = getColourIndex(indexPath.row)
        
        if indexPath.row < 3 {
            cell.detailTextLabel?.textColor = UIColor.darkText
        } else {
            cell.detailTextLabel?.textColor = UIColor.white
        }
        
        return cell
    }
}
