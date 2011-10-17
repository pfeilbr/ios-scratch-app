//
//  CGTextExamplesVC.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CGTextExamplesVC.h"

@implementation CGTextExamplesVC

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

    // flip drawing for iOS
    CGContextTranslateCTM(ctx, 0, s.height);
    CGContextScaleCTM(ctx, 1, -1);
    
    NSString *msg = @"Hello World pq";
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:128.0];
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSelectFont(ctx, [font.fontName UTF8String], font.pointSize, kCGEncodingMacRoman);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetTextDrawingMode(ctx, kCGTextFillStroke);
    
    // flip the text or it'll draw upside down
    //CGContextSetTextMatrix(ctx, CGAffineTransformScale(CGAffineTransformIdentity, 1, -1));

    CGContextSetShadow(ctx, CGSizeMake(5, 5), 25);
    
    CGSize ts = [msg sizeWithFont:font];
    CGPoint p = CGPointMake((s.width/2.0)-(ts.width/2.0), (s.height/2.0)-(ts.height/2.0));
    CGContextStrokeRect(ctx, CGRectMake(p.x, p.y, ts.width, ts.height));
    CGContextFillEllipseInRect(ctx, CGRectMake(p.x, p.y, 2, 2));    
    CGContextShowTextAtPoint(ctx, p.x, p.y, [msg UTF8String], [msg length]);
        
    CGContextRestoreGState(ctx);
}


@end
