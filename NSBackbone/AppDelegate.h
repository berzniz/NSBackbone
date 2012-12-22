//
//  AppDelegate.h
//  NSBackbone
//
//  Created by Tal Bereznitskey on 22/12/12.
//  Copyright (c) 2012 Tal Bereznitskey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BackboneViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BackboneViewController *viewController;

@end
