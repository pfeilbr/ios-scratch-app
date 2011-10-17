//
//  UIViewControllerBase.h
//  ScratchApp
//
//  Created by Brian Pfeil on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIViewControllerBase : UIViewController

- (CGSize)viewSize;
- (CGRect)viewBounds;

@end
