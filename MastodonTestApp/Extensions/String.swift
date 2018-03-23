//
//  String.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 23.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import UIKit

extension String {

    func makeAttributedStringFromHtml() -> NSAttributedString? {

        let encodedData = self.data(using: .utf8, allowLossyConversion: true)!

        do {
            let temp = try NSAttributedString(data: encodedData,
                                              options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
                                              documentAttributes: nil).string

            return NSAttributedString(string: temp, attributes: [NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 16.0)!])

        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }

}
