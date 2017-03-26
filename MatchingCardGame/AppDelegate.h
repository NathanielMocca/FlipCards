//
//  AppDelegate.h
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/26.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

