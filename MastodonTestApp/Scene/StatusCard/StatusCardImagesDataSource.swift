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
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return UICollectionViewCell()
    }

    
}
