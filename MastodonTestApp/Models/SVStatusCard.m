//
//  SVStatusCard.m
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

#import "SVStatusCard.h"
#import "MastodonTestApp-Swift.h"

static NSString *account = @"account";
static NSString *mediaAttachments = @"media_attachments";
static NSString *reblog = @"reblog";
static NSString *application = @"application";
static NSString *language = @"language";
static NSString *spoiler = @"spoiler_text";
static NSString *url = @"url";
static NSString *tags = @"tags";
static NSString *sensitive = @"sensitive";
static NSString *emojis = @"emojis";
static NSString *mentions = @"mentions";
static NSString *visibility = @"visibility";
static NSString *uri = @"uri";
static NSString *cardId = @"id";
static NSString *reblogsCount = @"reblogs_count";
static NSString *replyAccountId = @"in_reply_to_account_id";
static NSString *date = @"created_at";
static NSString *replyId = @"in_reply_to_id";
static NSString *favouritesCount = @"favourites_count";
static NSString *content = @"content";

@implementation SVStatusCard

- (instancetype)initWithServerResponce:(NSDictionary *) response {
    self = [super init];
    if (self) {

        self.account = [[SVAccountModel alloc] initWithServerResponce:response[account]];
        self.url = response[url];
        self.spoilerText = response[spoiler];
        self.cardId = response[cardId];
        self.dateOfCreate = [DateConverter dateFromString:response[date]];
        self.content = response[content];

        if ([response[emojis] isKindOfClass:[NSArray class]]) {
            self.emojis = response[emojis];
        }
    }
    return self;
}


@end
