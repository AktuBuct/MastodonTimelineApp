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

        let card = DataManager.sharedManager.selectedCard
        navigationItem.title = card?.account.displayName

        collectionViewDataSource.rootController = self
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDataSource
        configureCollectionView()

        textContentView.attributedText = card?.content.makeAttributedStringFromHtml()
        textContentView.isEditable = false
    }

}

private typealias ConfigureInterface = StatusCardVC

private extension ConfigureInterface {

    func configureCollectionView() {
        let minSize = min(view.bounds.height, view.bounds.width)
        let cellSize = CGSize(width:minSize , height:minSize)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}
