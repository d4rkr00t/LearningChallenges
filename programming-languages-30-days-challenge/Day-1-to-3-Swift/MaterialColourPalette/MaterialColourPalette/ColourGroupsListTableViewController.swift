//
//  ColourGroupsListTableViewController.swift
//  MaterialColourPalette
//
//  Created by Stanislav Sysoev on 2/28/17.
//  Copyright © 2017 Stanislav Sysoev. All rights reserved.
//

import UIKit

class ColourGroupsListTableViewController: UITableViewController {
    
    let colourGroups: [String] = [
        "red",
        "pink",
        "purple",
        "deep_purple"
    ]
    
    let coloursForGroups: [[CGFloat]] = [
        [244.0, 67.0, 54.0],
        [233.0, 30.0, 99.0],
        [156.0, 39.0, 176.0],
        [103.0, 58.0, 183.0]
    ]

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
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colourGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColourCell", for: indexPath)
        let rgb: [CGFloat] = coloursForGroups[indexPath.row]
        cell.backgroundColor = UIColor(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: 1.0)
        
        print(rgb)

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
