//
//  DataManager.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

@objcMembers
class DataManager: NSObject {

    static let sharedManager = DataManager()

    var wallCards = [SVStatusCard]()
    var selectedCard: SVStatusCard?
    var selectedImageUrl: URL?

    func getStatusCards(with completionHandler: @escaping (_ success:Bool) -> Void) {
        
        guard let serverManager = SVServerManager.sharedManager() as? SVServerManager else {
            return
        }
        
        serverManager.getPublicStatusCards(success: { (response) in
            
            var allCards = [SVStatusCard]()
            
            response?.forEach({ (card) in
                let statusCard = SVStatusCard(serverResponce: card as? [AnyHashable: Any])
                if statusCard != nil { allCards += [statusCard!] }
            })
            
            self.wallCards = allCards
            
            completionHandler(true)
            
        }) { (error) in
            
        }
    }
    
}
