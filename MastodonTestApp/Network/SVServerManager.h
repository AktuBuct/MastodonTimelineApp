//
//  SVServerManager.h
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void (^SVCompletionBlock)(NSArray *response);
typedef  void (^SVFailureBlock)(NSError *error);

@interface SVServerManager : NSObject

+ (id)sharedManager;

- (void) getPublicStatuCardsWithSuccess:(SVCompletionBlock)success
                              onFailure:(SVFailureBlock)failure;

@end
