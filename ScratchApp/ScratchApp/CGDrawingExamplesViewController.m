//
//  CGDrawingExamplesViewController.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CGDrawingExamplesViewController.h"

@implementation CGDrawingExamplesViewController

@synthesize contentLayer=_contentLayer;

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

    self.contentLayer = [CALayer layer];
    _contentLayer.frame = [self viewBounds];
    _contentLayer.delegate = self;
    [self.view.layer addSublayer:_contentLayer];
 
    // need to call this to force drawLayer:inContext to be called
    [_contentLayer setNeedsDisplay];
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
    return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"drawLayer called");
    
    CGContextSaveGState(ctx);
    
    CGSize s = layer.bounds.size;
    
    CGFloat numSections = 4;
    CGFloat sectionWidth = s.width;
    CGFloat sectionHeight = s.height / numSections;
    CGFloat currSectionNum;
    
    currSectionNum = 1;
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGFloat side = sectionHeight;
    CGContextFillRect(ctx, CGRectMake(
                                      (sectionWidth/2) - (side/2),
                                      (sectionHeight*(currSectionNum - 1)),
                                      side,
                                      side));
    
    
    currSectionNum = 2;    
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 5);
    CGContextStrokeRect(ctx, CGRectMake(
                                        (sectionWidth/2) - (side/2),
                                        (sectionHeight*(currSectionNum - 1)),
                                        side,
                                        side));
    
    currSectionNum = 3;
    CGContextStrokeEllipseInRect(ctx, CGRectMake(
                                                 (sectionWidth/2) - (side/2),
                                                 (sectionHeight*(currSectionNum - 1)),
                                                 side,
                                                 side));
    
    currSectionNum = 4;
    CGContextFillEllipseInRect(ctx, CGRectMake(
                                                 (sectionWidth/2) - (side/2),
                                                 (sectionHeight*(currSectionNum - 1)),
                                                 side,
                                                 side));

    
    CGContextRestoreGState(ctx);
    

}

@end
