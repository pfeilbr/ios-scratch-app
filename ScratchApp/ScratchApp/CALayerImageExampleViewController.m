//
//  CALayerImageExampleViewController.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CALayerImageExampleViewController.h"

@implementation CALayerImageExampleViewController

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    CGSize s = self.view.bounds.size;
    
    CALayer *l = self.view.layer;
    
    UIImage *i = [UIImage imageNamed:@"Apple.png"];    
    l.frame = CGRectMake(0, 0, i.size.width, i.size.height);
    l.position = CGPointMake(s.width/2, s.height/2);
    
    // set the image as the contents of the layer
    l.contents = (id)i.CGImage;
    
    // center the image
    l.contentsGravity = kCAGravityCenter;
    
    // scale image by 2
    l.contentsScale = 0.5;
    l.backgroundColor = [UIColor blueColor].CGColor;
    l.opacity = 1.0;
    l.cornerRadius = 10.0;
    
    l.borderColor = [UIColor blackColor].CGColor;
    l.borderWidth = 1.0;
    l.shadowRadius = 20.0;
    l.shadowColor = [UIColor blackColor].CGColor;
    l.shadowOffset = CGSizeMake(10, 10);
    l.shadowOpacity = 1.0;
}

@end
