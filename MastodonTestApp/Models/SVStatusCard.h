//
//  SVStatusCard.h
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVAccountModel.h"

@interface SVStatusCard : NSObject

@property (strong, nonatomic) SVAccountModel *account;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSArray *emojis;
@property (copy, nonatomic) NSString *spoilerText;
@property (copy, nonatomic) NSString *cardId;
@property (strong, nonatomic) NSDate *dateOfCreate;
@property (copy, nonatomic) NSString *content;

- (instancetype)initWithServerResponce:(NSDictionary *) response;

@end
