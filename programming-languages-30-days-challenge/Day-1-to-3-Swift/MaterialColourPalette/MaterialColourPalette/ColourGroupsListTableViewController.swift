//
//  ColourGroupsListTableViewController.swift
//  MaterialColourPalette
//
//  Created by Stanislav Sysoev on 2/28/17.
//  Copyright © 2017 Stanislav Sysoev. All rights reserved.
//

import UIKit

class ColourGroupsListTableViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let grBgColors = [UIColor.red, UIColor.blue]
        let gradientLoc: [NSNumber] = [0.0, 1.0]
        let grLayer = CAGradientLayer()
        grLayer.colors = grBgColors
        grLayer.locations = gradientLoc
        
        grLayer.frame = tableView.bounds
        let bgView = UIView(frame: tableView.bounds)
        bgView.layer.insertSublayer(grLayer, at: 0)
        tableView.backgroundView = bgView

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
        }
    }
}
