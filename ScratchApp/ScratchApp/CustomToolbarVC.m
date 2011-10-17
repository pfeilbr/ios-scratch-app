//
//  CustomToolbarVC.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomToolbarVC.h"

@interface TransparentToolbar : UIToolbar
@end

@implementation TransparentToolbar

- (void)drawRect:(CGRect)rect { /* do nothing here */}

- (void) applyTranslucentBackground {
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    self.translucent = YES;
}

- (id) init {
    self = [super init];
    [self applyTranslucentBackground];
    return self;
}

- (id) initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    [self applyTranslucentBackground];
    return self;
}

@end

@implementation CustomToolbarVC

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

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    UIView *v = [[UIView alloc] init];
    v.autoresizesSubviews = YES;
    v.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;    
    v.backgroundColor = [UIColor greenColor];
    
    _tb = [[TransparentToolbar alloc] init];
    _tb.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;    
    _tb.opaque = NO;
    _tb.barStyle = UIBarStyleBlack;
    _tb.backgroundColor = [UIColor clearColor];
    _tb.translucent = YES;
    _tb.tintColor = [UIColor clearColor];
    _tb.items = [NSArray arrayWithObjects:[[UIBarButtonItem alloc] initWithTitle:@"button 1" style:UIBarButtonItemStylePlain target:nil action:nil],
                 [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Apple.png"]]],
                nil];
    [v addSubview:_tb];
    
    self.view = v;
    [v release];

}

- (void)viewWillAppear:(BOOL)animated {
    CGSize s = self.view.bounds.size;
    CGSize tbs = _tb.bounds.size;
    _tb.frame = CGRectMake(0, s.height - 44, s.width, 44);
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
