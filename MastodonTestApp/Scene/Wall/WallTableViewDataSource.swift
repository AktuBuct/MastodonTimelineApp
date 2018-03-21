//
//  WallTableViewDataSource.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import UIKit

class WallTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate  {

    weak var rootController: WallTableViewController!

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(rootController.statusCards.count)
        return rootController.statusCards.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let statusCardCellId = "statusCardCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: statusCardCellId)
        cell?.textLabel?.text = rootController.statusCards[indexPath.row].cardId

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.isUserInteractionEnabled = false

        DataManager.sharedManager.selectedCard = rootController.statusCards[indexPath.row]

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            tableView.isUserInteractionEnabled = true
        }
    }

}
