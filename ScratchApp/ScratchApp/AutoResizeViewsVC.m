//
//  AutoResizeViewsVC.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AutoResizeViewsVC.h"

static UILabel *labelTop;
static UILabel *labelMiddle;
static UILabel *labelBottom;

@implementation AutoResizeViewsVC

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

- (UILabel*)createLabel:(NSString*)text {
    UILabel *l = [[UILabel alloc] init];
    l.autoresizesSubviews = YES;
    l.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;    
    l.text = text;
    l.textAlignment = UITextAlignmentCenter;
    return l;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    UIView *v = [self createView];
    v.backgroundColor = [UIColor greenColor];
    
    labelTop = [self createLabel:@"Top"];
    labelTop.backgroundColor = [UIColor redColor];
    [v addSubview:labelTop];

    labelMiddle = [self createLabel:@"Middle"];
    labelMiddle.backgroundColor = [UIColor yellowColor];
    [v addSubview:labelMiddle];

    
    labelBottom = [self createLabel:@"Bottom"];
    labelBottom.backgroundColor = [UIColor blueColor];
    [v addSubview:labelBottom];
    
    self.view = v;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (void)viewWillAppear:(BOOL)animated {
    CGSize s = self.view.bounds.size;
    NSLog(@"s = %@", CGSizeCreateDictionaryRepresentation(s));
    
    labelTop.frame = CGRectMake(0, 0, s.width, s.height * 0.2);

    labelMiddle.frame = CGRectMake(0, (s.height/2) - ((s.height * 0.2)/2), s.width, s.height * 0.2);
    
    labelBottom.frame = CGRectMake(0, s.height - (s.height * 0.2), s.width, s.height * 0.2);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
