//
//  main.m
//  ScratchApp
//
//  Created by Brian Pfeil on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ScratchAppAppDelegate.h"

int main(int argc, char *argv[])
{
    int retVal = 0;
    @autoreleasepool {
        retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([ScratchAppAppDelegate class]));
    }
    return retVal;
}
