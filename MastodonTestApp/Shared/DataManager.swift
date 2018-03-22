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

    func getStatusCards() {

        guard let serverManager = SVServerManager.sharedManager() as? SVServerManager else {
            return
        }

        serverManager.getPublicStatuCards(success: { (response) in

            var allCards = [SVStatusCard]()

            response?.forEach({ (card) in
                let statusCard = SVStatusCard.init(serverResponce: card as? [AnyHashable: Any])
                if statusCard != nil { allCards += [statusCard!] }
            })

            self.wallCards = allCards

        }) { (error) in

        }
    }

    func makeAttributedString(from encodedString: String) -> NSAttributedString? {

        let encodedData = encodedString.data(using: .utf8, allowLossyConversion: true)!

        do {
            return try NSAttributedString(data: encodedData, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
                        print(error.localizedDescription)
                        return nil
                    }
    }

}
