//
//  StatusCardCell.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import UIKit

class StatusCardCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var acctLabel: UILabel!
    @IBOutlet weak var placedTimeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    func configure(with statusCard: SVStatusCard) {

        nameLabel.text = statusCard.account.displayName
        acctLabel.text = "@" + statusCard.account.acct
        contentLabel.attributedText = statusCard.content
        placedTimeLabel.text = DateConverter.intervalStringFrom(date: statusCard.dateOfCreate)

        avatarImage.sd_setImage(with: statusCard.account.avatarUrl, placeholderImage: UIImage(named: "pict_default.png"))

        if statusCard.mediaAttachments.count > 0 {
            accessoryType = .detailButton
        } else {
            accessoryType = .none
        }
    }

}
