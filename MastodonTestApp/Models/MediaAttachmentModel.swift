//
//  MediaAttachmentModel.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

private enum SerializationKey: String {
    case attachmentId = "id"
    case type = "type"
    case url = "url"
    case previewUrl = "preview_url"
    case remoteUrl = "remote_url"
    case textUrl = "text_url"
    case meta = "meta"
    case description = "description"
}

@objcMembers
class MediaAttachmentModel: NSObject {

    let type: String?
    let url: URL?
    let previewUrl: URL?
    let remoteUrl: URL?
    let textUrl: URL?

    init(withServerResponce response: [String: AnyObject]) {

        func makeUrl(from object: AnyObject?) -> URL? {
            guard let urlString = object as? String else {
                return nil
            }

            return URL(string: urlString)
        }

        url = makeUrl(from: response[SerializationKey.url.rawValue])
        previewUrl = makeUrl(from: response[SerializationKey.previewUrl.rawValue])
        remoteUrl = makeUrl(from: response[SerializationKey.remoteUrl.rawValue])
        textUrl = makeUrl(from: response[SerializationKey.textUrl.rawValue])
        type = response[SerializationKey.type.rawValue] as? String
    }

}

