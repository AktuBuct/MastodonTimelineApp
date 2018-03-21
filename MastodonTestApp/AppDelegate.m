//
//  AppDelegate.m
//  MastodonTestApp
//
//  Created by AktuBuct on 21.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

//Необходимо разработать приложение с (минимум) двумя экранами.
//Предлагается сделать это для API Mastodon:
//https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md
//Сделать экран с таймлайном (можно без подгрузки дополнительных статусов).
//В карточке статуса должны быть:
//- аватар пользователя
//- никнейм и имя пользователя
//- Текст статуса
//- Время, прошедшее с отправки
//Можно не обрабатывать все остальные возможности, такие как спойлеры, эмодзи и.т.д.
//При клике на элемент в таймлайне должен открываться второй экран со статусом. Показать картинку из статуса, если она есть (достаточно одной, даже если их больше).
//Обращаем внимание на то, что эти запросы не требуют авторизации.
//Желательно умение заложить архитектуру, написать пример юнит-теста.
//Если очевидно, что задание занимает больше двух дней, то разрешается урезать функционал и объяснить возникшие сложности.
//В дизайне можно ориентироваться на другие приложения, в частности Amaroq.
//https://itunes.apple.com/us/app/amarok-for-mastodon/id1214116200?ls=1&mt=8
//https://github.com/tootsuite/documentation/blob/master/Using-Mastodon/Apps.md#ios

#import "AppDelegate.h"
#import "SVServerManager.h"
#import "SVStatusCard.h"
#import "MastodonTestApp-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [[DataManager sharedManager] getStatusCards];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
