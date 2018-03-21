//
//  SVStatusCard.m
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

#import "SVStatusCard.h"
#import "MastodonTestApp-Swift.h"

@implementation SVStatusCard

- (instancetype)initWithServerResponce:(NSDictionary *) response {
    self = [super init];
    if (self) {

        self.account = [[SVAccountModel alloc] initWithServerResponce:response[CardKeys.account]];
        self.url = response[CardKeys.url];
        self.spoilerText = response[CardKeys.spoiler];
        self.cardId = response[CardKeys.cardId];
        self.dateOfCreate = [DateConverter dateFromString:response[CardKeys.date]];
        self.content = response[CardKeys.content];

        if ([response[CardKeys.emojis] isKindOfClass:[NSArray class]]) {
            self.emojis = response[CardKeys.emojis];
        }
    }
    return self;
}


@end
