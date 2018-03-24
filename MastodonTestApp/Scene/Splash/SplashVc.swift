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
    var reachabilityManager: ReachabilityManager?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        reachabilityManager = ReachabilityManager()
        reachabilityManager?.action = { [weak self] in
            guard let connection = self?.reachabilityManager?.reachability?.connection else { return }
            if connection == .wifi || connection == .cellular { self?.loadData() }
        }
    }

    func loadData() {
        activityIndicator.startAnimating()

        DataManager.sharedManager.getStatusCards { (success) in
            self.activityIndicator.stopAnimating()
            self.performSegue(withIdentifier: "InitialSegue", sender: nil)
        }
    }

}
