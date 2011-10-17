//
//  ScratchAppAppDelegate.m
//  ScratchApp
//
//  Created by Brian Pfeil on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScratchAppAppDelegate.h"
#import "ItemsTableViewController.h"

@implementation ScratchAppAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // grab config from config.json
    NSString *configPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"json"];
    NSString *jsonConfigContents = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:configPath] encoding:NSUTF8StringEncoding error:nil];
    gConfig = [jsonConfigContents JSONValue];
        
    // Override point for customization after application launch.
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:screenBounds];

    ItemsTableViewController *itemsTableViewController = [[ItemsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    itemsTableViewController.title = @"Scratch App";
    itemsTableViewController.items = [gConfig valueForKeyPath:@"ui.main.items"];
    
    NSDictionary *autoShowItem = [gConfig valueForKeyPath:@"ui.main.autoshow"];
    if (autoShowItem && [[autoShowItem valueForKeyPath:@"enabled"] boolValue]) {
        NSString *className = [autoShowItem valueForKeyPath:@"className"];
        Class klass = NSClassFromString(className);
        UIViewController *vc = [[klass alloc] init];
        vc.title = [autoShowItem valueForKeyPath:@"displayName"];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    } else {
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:itemsTableViewController];
    }
    
    [_window addSubview:_navigationController.view];
    
    NSLog(@"%@", [_window recursiveDescription]);
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
