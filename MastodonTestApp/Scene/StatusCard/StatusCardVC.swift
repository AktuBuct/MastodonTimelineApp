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

    var attachments: [MediaAttachmentModel] {
        guard let result = DataManager.sharedManager.selectedCard?.mediaAttachments as? [MediaAttachmentModel] else {
            return [MediaAttachmentModel]()
        }
        return result
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = DataManager.sharedManager.selectedCard?.account.displayName
        collectionViewDataSource.rootController = self
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDataSource
        textContentView.attributedText = DataManager.sharedManager.selectedCard?.content
        textContentView.isEditable = false
    }

}
