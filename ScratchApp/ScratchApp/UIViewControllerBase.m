//
//  UIViewControllerBase.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIViewControllerBase.h"

@implementation UIViewControllerBase

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


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
    self.view.autoresizesSubviews = YES;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    // resize contentLayer if it exists
    // NOTE: contentLayer will be property defined in a subclass
    if ([self respondsToSelector:@selector(contentLayer)]) {
        CALayer *contentLayer = [self performSelector:@selector(contentLayer)];
        contentLayer.frame = self.view.bounds;
        [contentLayer setNeedsDisplay];
    }
}

- (CGSize)viewSize {
    CGSize size = CGSizeZero;
    
    if (self.navigationController) {
        if (!self.navigationController.isNavigationBarHidden) {
            CGSize s = self.navigationController.navigationBar.bounds.size;
            size = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - s.height);
        }
    } else {
        size = self.view.bounds.size;
    }
    return size;
}

- (CGRect)viewBounds {
    CGSize viewSize = [self viewSize];
    return CGRectMake(0, 0, viewSize.width, viewSize.height);
}

@end
