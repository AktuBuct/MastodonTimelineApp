//
//  ReachabilityManager.swift
//  InternetIndicator
//
//  Created by AktuBuct on 09.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation
import Reachability

class ReachabilityManager {

    private var alert: UIAlertController?
    let reachability = Reachability()
    var action: (()->Void)?

    init() {
        createReachability()
    }

    @objc fileprivate func reachabilityChanged() {

        guard let reachability = reachability else { return }
        action?()

        switch reachability.connection {
        case .wifi, .cellular:
            alert?.dismiss(animated: true, completion: nil)
            reachability.stopNotifier()

        case .none:
            createAlertView()
            let rootController = UIApplication.shared.keyWindow?.rootViewController
            rootController?.present(alert!, animated: true, completion: nil)
        }
    }

    fileprivate func createReachability() {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged), name: .reachabilityChanged, object: reachability)
        do{
            try reachability?.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }

    fileprivate func createAlertView() {
        let pending = UIAlertController(title: "Please check your internet connection\n", message: nil, preferredStyle: .alert)

        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .gray
        pending.view.addSubview(indicator)

        let views = ["pending" : pending.view, "indicator" : indicator]
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[indicator]-(15)-|", options: [.alignAllCenterX], metrics: nil, views: views as [String : AnyObject])
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[indicator]|", options: .alignAllCenterX, metrics: nil, views: views as [String : AnyObject])

        pending.view.addConstraints(constraints)

        indicator.isUserInteractionEnabled = false
        indicator.startAnimating()
        alert = pending
    }
}
