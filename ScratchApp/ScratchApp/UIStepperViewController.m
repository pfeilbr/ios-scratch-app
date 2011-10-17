//
//  UIStepperViewController.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIStepperViewController.h"

@implementation UIStepperViewController

@synthesize stepper=_stepper;
@synthesize label=_label;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize s = [self viewSize];
    
    self.stepper = [[UIStepper alloc] init];
    _stepper.layer.position = CGPointMake(s.width/2, s.height/2);
    _stepper.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:_stepper];
    
    self.label = [[UILabel alloc] init];
    _label.text = [NSString stringWithFormat:@"%d", _stepper.value];
    [self.view addSubview:_label];
    
    [_stepper addTarget:self action:@selector(onStepper:) forControlEvents:UIControlEventValueChanged];    
    
}

- (void)onStepper:(id)target {
    _label.text = [NSString stringWithFormat:@"%d", _stepper.value];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
