//
//  WallTableViewController.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import UIKit

class WallTableViewController: UITableViewController {

    private let tableViewDataSource = WallTableViewDataSource()

    var statusCards: [SVStatusCard] {
        return DataManager.sharedManager.wallCards
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
        tableViewDataSource.rootController = self
    }
}
