//
//  StatusCardVC.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import UIKit

class StatusCardVC: UIViewController {

    @IBOutlet weak var textContentView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!

    private let collectionViewDataSource = StatusCardImagesDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = DataManager.sharedManager.selectedCard?.account.displayName
        collectionViewDataSource.rootController = self
        textContentView.attributedText = DataManager.sharedManager.selectedCard?.content
        textContentView.isEditable = false
    }

}
