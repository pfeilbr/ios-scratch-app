//
//  ScrollViewWithTiledViewsVC.m
//  ScratchApp
//
//  Created by Brian Pfeil on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollViewWithTiledViewsVC.h"

@interface ScrollViewWithTiledViewsVC()
- (UIView*)createView;
- (UIView*)createTileView;
@end

@implementation ScrollViewWithTiledViewsVC

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

- (UIView*)createView {
    UIView *v = [[UIView alloc] init];
    v.autoresizesSubviews = YES;
    v.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;    
    return v;
}

- (UIView*)createTileView {
    UIView *v = [[UIView alloc] init];
    v.autoresizesSubviews = YES;
    v.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;    
    v.backgroundColor = [UIColor redColor];
    
    CALayer *l = [v layer];
    [l setShadowColor:[UIColor blackColor].CGColor];
    [l setShadowOffset:CGSizeMake(0.5f, 5.0f)];
    [l setShadowOpacity:0.5f];
    [l setShadowRadius:5.0f];
    [l setMasksToBounds:NO];
    
	UITapGestureRecognizer *singleFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleFingerDoubleTap:)];
    singleFingerDoubleTap.numberOfTapsRequired = 1;
	singleFingerDoubleTap.delegate = self;
	
    [v addGestureRecognizer:singleFingerDoubleTap];
    [singleFingerDoubleTap release];	
    
    return v;
}

- (void)handleSingleFingerDoubleTap:(id)target {
    NSLog(@"double tapped");
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    UIView *v = [self createView];
    v.backgroundColor = [UIColor greenColor];
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.autoresizesSubviews = YES;
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;    
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.opaque = NO;
    
    [v addSubview:_scrollView];
    
    self.view = v;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGSize s = self.view.bounds.size;
    
    CGFloat tilesPerRow = 3.0;
    self.view.frame = CGRectMake(0, 0, s.width, s.height);
    self.view.backgroundColor = [UIColor darkGrayColor];
    _scrollView.frame = CGRectMake(0, 0, s.width, s.height);
    _scrollView.contentSize = CGSizeMake(s.width * tilesPerRow, s.height);
    _scrollView.pagingEnabled = YES;
    
    CGFloat lastXPos = 0;
    CGFloat padding = 15.0;
    CGFloat side = (s.width - ((tilesPerRow + 1)*padding)) / tilesPerRow;
    
    for (int i = 0; i < 12; i++) {
        UIView *v = [self createTileView];
        
        if (lastXPos == 0) {
            v.frame = CGRectMake( lastXPos + padding, padding, side, side);
        } else if (i%((int)tilesPerRow) == 0) {
            v.frame = CGRectMake( lastXPos + (padding * 2) + side, padding, side, side);
        }else {
            v.frame = CGRectMake( lastXPos + padding + side, padding, side, side);
        }
        lastXPos = v.frame.origin.x;
        
        [_scrollView addSubview:v];
    }
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

@end
