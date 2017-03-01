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
    var colourGroup: MaterialColours = MaterialColours.red
    
    var atTop: Bool = true
    var atBottom: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
        tableView.backgroundColor = colours[0]
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
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 70 * 2 {
            if !atTop {
                print("set top bg");
                atTop = true
                atBottom = false
                tableView.backgroundColor = colours[0]
            }
        } else {
            if !atBottom {
                print("set bottom bg");
                atTop = false
                atBottom = true
                tableView.backgroundColor = colours.last
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
        return colours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellColour", for: indexPath)
        let colour = colours[indexPath.row]
        cell.backgroundColor = colour
        cell.detailTextLabel?.text = colour.toHexString().uppercased()
        cell.textLabel?.text = getColourIndex(indexPath.row)
        
        if materialLabelColours[colourGroup]![indexPath.row] == 0 {
            cell.textLabel?.textColor = UIColor.darkText
            cell.detailTextLabel?.textColor = UIColor.darkText
        } else {
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        }
        
        return cell
    }
}
