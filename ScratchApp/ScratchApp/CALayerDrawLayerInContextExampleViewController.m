//
//  CALayerDrawLayerInContextExampleViewController.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CALayerDrawLayerInContextExampleViewController.h"

@implementation CALayerDrawLayerInContextExampleViewController

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

    CALayer *layer = [CALayer layer];
    layer.frame = [self viewBounds];
    layer.delegate = self;
    [self.view.layer addSublayer:layer];
    
    // need to call this to force drawLayer:inContext to be called
    [layer setNeedsDisplay];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSaveGState(ctx);
    
    //CGContextClipToRect(ctx, CGRectMake(0, 0, 25, 25));
    //layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    
    
    NSString *msg = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:18.0];
    CGSize s = [msg sizeWithFont:font];
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSelectFont(ctx, [font.fontName UTF8String], font.pointSize, kCGEncodingMacRoman);
    // flip the text or it'll draw upside down
    CGContextSetTextMatrix(ctx, CGAffineTransformScale(CGAffineTransformIdentity, 1, -1));
    
    CGContextShowTextAtPoint(ctx, 5, 30, [msg UTF8String], [msg length]);
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, 25, 25));
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 5);
    CGContextStrokeRect(ctx, layer.bounds);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
    
    CGContextRestoreGState(ctx);
}


@end
