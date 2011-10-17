//
//  BPBox.h
//  ScratchApp
//
//  Created by Brian Pfeil on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface BPBox : NSObject {
    CGRect contentRect;
    CGFloat margin;
}

- (id)initWithRect:(CGRect)rect;

- (CGRect)rectTopLeft:(CGSize)size;

@end
