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
    private var activityIndicatorView: UIActivityIndicatorView!

    var statusCards: [SVStatusCard] {
        return DataManager.sharedManager.wallCards
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
        tableViewDataSource.rootController = self
        setupRefreshControl()
        setupActivityIndicatorView()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if DataManager.sharedManager.selectedCard == nil {
            updateStatuses()
        } else {
            DataManager.sharedManager.selectedCard = nil
        }
    }

    @objc private func updateStatuses() {
        activityIndicatorView.startAnimating()
        view.isUserInteractionEnabled = false

        DataManager.sharedManager.getStatusCards { (success) in
            self.refreshControl?.endRefreshing()
            self.activityIndicatorView.stopAnimating()
            self.tableView.reloadData()
            self.view.isUserInteractionEnabled = true
        }
    }

}

private extension WallTableViewController {

    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = .groupTableViewBackground
        refreshControl?.addTarget(self, action: #selector(updateStatuses), for: .valueChanged)
    }

    func setupActivityIndicatorView() {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.center = view.center
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = .blue

        view.addSubview(activityIndicatorView)
    }

}
