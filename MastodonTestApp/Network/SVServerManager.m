//
//  SVServerManager.m
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

#import "SVServerManager.h"
#import "AFNetworking.h"

@interface SVServerManager ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation SVServerManager

+ (id)sharedManager {
    static SVServerManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];

        NSURL *url = [NSURL URLWithString:@"https://mastodon.social/api/v1/timelines/"];

        NSURLSessionConfiguration *configuration;

        sharedMyManager.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url
                                                       sessionConfiguration:configuration];

    });
    return sharedMyManager;
}

- (void) getPublicStatusCardsWithSuccess:(SVCompletionBlock)success
                          onFailure:(SVFailureBlock)failure {

    NSString *urlString = @"public";
    NSDictionary *params = [NSDictionary dictionary];

    [self.sessionManager GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
