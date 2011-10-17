//
//  Utils.h
//  ScratchApp
//
//  Created by Brian Pfeil on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "BPBox.h"

extern CGRect rectTopCenter(CGRect rect, CGSize size) {
    return CGRectMake(
                      (rect.size.width/2)-(size.width/2),
                      (rect.size.height)-(size.height),
                      size.width,
                      size.height);
}

extern CGRect rectMiddleCenter(CGRect rect, CGSize size) {
    return CGRectMake(
                      (rect.size.width/2)-(size.width/2),
                      (rect.size.height/2)-(size.height/2),
                      size.width,
                      size.height);
}

extern CGRect rectBottomCenter(CGRect rect, CGSize size) {
    return CGRectMake(
                      (rect.size.width/2)-(size.width/2),
                      0,
                      size.width,
                      size.height);
}