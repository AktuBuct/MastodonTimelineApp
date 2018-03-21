//
//  SVAccountModel.h
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVAccountModel : NSObject

@property (assign, nonatomic) NSInteger followersCount;
@property (assign, nonatomic) NSInteger followingCount;
@property (assign, nonatomic) NSInteger statusesCount;
@property (strong, nonatomic) NSURL *avatarUrl;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSURL *headerUrl;
@property (strong, nonatomic) NSDate *dateOfCreate;
@property (copy, nonatomic) NSString *accountId;
@property (copy, nonatomic) NSString *acct;
@property (copy, nonatomic) NSString *displayName;
@property (copy, nonatomic) NSString *note;



- (instancetype)initWithServerResponce:(NSDictionary *) response;

@end
