//
//  CGDrawImageExamplesVC.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CGDrawImageExamplesVC.h"

@implementation CGDrawImageExamplesVC

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

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx {
    CGContextSaveGState(ctx);
    
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    CGSize s = layer.bounds.size;

    // flip for iOS
    CGContextTranslateCTM(ctx, 0, s.height);
    CGContextScaleCTM(ctx, 1, -1);

    UIImage *image = [UIImage imageNamed:@"Apple.png"];
    CGRect rect = rectMiddleCenter(layer.bounds, image.size);

    // draw image
    CGContextDrawImage(ctx, rect, image.CGImage);

    CGContextRestoreGState(ctx);
}

@end
