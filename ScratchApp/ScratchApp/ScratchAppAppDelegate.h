//
//  ScratchAppAppDelegate.h
//  ScratchApp
//
//  Created by Brian Pfeil on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

NSDictionary *gConfig;

@interface ScratchAppAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
