//
//  StatusCardImagesDataSource.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

class StatusCardImagesDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    weak var rootController: StatusCardVC!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rootController.attachments.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellId = "imageCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCell

        let attachment = rootController.attachments[indexPath.row]
        cell.imageView.sd_setImage(with: attachment.url, placeholderImage: UIImage(named: "pict_default.png"))

        return cell
    }
    
}
