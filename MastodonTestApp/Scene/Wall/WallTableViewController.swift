//
//  WallTableViewController.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class WallTableViewController: UITableViewController {

    private let tableViewDataSource = WallTableViewDataSource()

    var statusCards: [SVStatusCard] {
        return DataManager.sharedManager.wallCards
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
        tableView.emptyDataSetSource = self
        tableViewDataSource.rootController = self
        navigationItem.title = "Timeline"

        setupRefreshControl()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if DataManager.sharedManager.selectedCard == nil {
            tableView.reloadData()
        } else {
            DataManager.sharedManager.selectedCard = nil
        }
    }

}

private typealias Handlers = WallTableViewController

fileprivate extension Handlers {

    @objc private func updateStatuses() {
        view.isUserInteractionEnabled = false

        DataManager.sharedManager.getStatusCards { (success) in
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
            self.view.isUserInteractionEnabled = true
        }
    }

}

private typealias ConfigureInterface = WallTableViewController

private extension ConfigureInterface {

    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = .groupTableViewBackground
        refreshControl?.addTarget(self, action: #selector(updateStatuses), for: .valueChanged)
    }

}

extension WallTableViewController: DZNEmptyDataSetSource {

    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString? {

        let text = "No results"
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }

    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .phone ? -75.0 : -120.0
    }

}
