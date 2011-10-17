//
//  BPBox.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BPBox.h"

@implementation BPBox

- (id)initWithRect:(CGRect)rect {
    self = [super init];
    if (self) {
        contentRect = rect;
        margin = 0;
    }
    return self;
}

- (CGRect)rectTopLeft:(CGSize)size {

}

@end
