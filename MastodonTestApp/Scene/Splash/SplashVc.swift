//
//  SplashVc.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import UIKit

class SplashVc: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DataManager.sharedManager.getStatusCards { (success) in
            self.activityIndicator.stopAnimating()
            self.performSegue(withIdentifier: "InitialSegue", sender: nil)
        }
    }
}
