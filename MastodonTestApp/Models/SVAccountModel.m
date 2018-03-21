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

- (instancetype)initWithServerResponce:(NSDictionary *) response {
    self = [super init];
    if (self) {

        self.followersCount = [response[AccountKeys.followersCount] integerValue];
        self.followingCount = [response[AccountKeys.followingCount] integerValue];
        self.statusesCount = [response[AccountKeys.statusesCount] integerValue];

        self.avatarUrl = [NSURL URLWithString:response[AccountKeys.avatar]];
        self.url = [NSURL URLWithString:response[AccountKeys.url]];
        self.headerUrl = [NSURL URLWithString:response[AccountKeys.header]];

        self.dateOfCreate = [DateConverter dateFromString:response[AccountKeys.dateOfCreate]];
        self.accountId = response[AccountKeys.accountId];
        self.acct = response[AccountKeys.acct];
        self.displayName = response[AccountKeys.displayName];
        self.note = response[AccountKeys.note];

    }
    return self;
}

@end
