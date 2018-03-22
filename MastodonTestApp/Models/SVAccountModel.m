//
//  SVAccountModel.m
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

#import "SVAccountModel.h"
#import "MastodonTestApp-Swift.h"

@implementation SVAccountModel

static NSString *accountId = @"id";
static NSString *followersCount = @"followers_count";
static NSString *acctKey = @"acct";
static NSString *note = @"note";
static NSString *avatarStatic = @"avatar_static";
static NSString *dateOfCreate = @"created_at";
static NSString *url = @"url";
static NSString *followingCount = @"following_count";
static NSString *statusesCount = @"statuses_count";
static NSString *avatar = @"avatar";
static NSString *header = @"header";
static NSString *displayName = @"display_name";
static NSString *locked = @"locked";
static NSString *username = @"username";
static NSString *headerStatistic = @"header_statistic";

- (instancetype)initWithServerResponce:(NSDictionary *) response {
    self = [super init];
    if (self) {

        self.followersCount = [response[followersCount] integerValue];
        self.followingCount = [response[followingCount] integerValue];
        self.statusesCount = [response[statusesCount] integerValue];

        self.avatarUrl = [NSURL URLWithString:response[avatar]];
        self.url = [NSURL URLWithString:response[url]];
        self.headerUrl = [NSURL URLWithString:response[header]];

        self.dateOfCreate = [DateConverter dateFromString:response[dateOfCreate]];
        self.accountId = response[accountId];
        self.acct = response[acctKey];
        self.displayName = response[displayName];
        self.note = response[note];
    }
    return self;
}

@end
