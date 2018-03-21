//
//  SerializationKeys.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

@objcMembers
class CardKeys: NSObject {
    static let account = "account"
    static let mediaAttachments = "media_attachments"
    static let reblog = "reblog"
    static let application = "application"
    static let language = "language"
    static let spoiler = "spoiler_text"
    static let url = "url"
    static let tags = "tags"
    static let sensitive = "sensitive"
    static let emojis = "emojis"
    static let mentions = "mentions"
    static let visibility = "visibility"
    static let uri = "uri"
    static let cardId = "id"
    static let reblogsCount = "reblogs_count"
    static let replyAccountId = "in_reply_to_account_id"
    static let date = "created_at"
    static let replyId = "in_reply_to_id"
    static let favouritesCount = "favourites_count"
    static let content = "content"
}

class AccountKeys: NSObject {
    static let accountId = "id"
    static let followersCount = "followers_count"
    static let acct = "acct"
    static let note = "note"
    static let avatarStatic = "avatar_static"
    static let dateOfCreate = "created_at"
    static let url = "url"
    static let followingCount = "following_count"
    static let statusesCount = "statuses_count"
    static let avatar = "avatar"
    static let header = "header"
    static let displayName = "display_name"
    static let locked = "locked"
    static let username = "username"
    static let headerStatistic = "header_statistic"
}

