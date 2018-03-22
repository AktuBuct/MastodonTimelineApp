//
//  ImageVc.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//


class ImageVc: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.sd_setImage(with: DataManager.sharedManager.selectedImageUrl, placeholderImage:UIImage(named: "pict_default.png"))
    }

}
