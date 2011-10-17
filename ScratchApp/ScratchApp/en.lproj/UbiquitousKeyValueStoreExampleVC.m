//
//  UbiquitousKeyValueStoreExampleVC.m
//  ScratchApp
//
//  Created by Brian Pfeil on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UbiquitousKeyValueStoreExampleVC.h"

@implementation UbiquitousKeyValueStoreExampleVC

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

    _keyTextField = [[UITextField alloc] init];
    _keyTextField.placeholder = @"key";
    [v addSubview:_keyTextField];
    _valueTextField = [[UITextField alloc] init];
    _valueTextField.placeholder = @"value";
    [v addSubview:_valueTextField];
    _btnSet = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnSet.titleLabel.text = @"Set";
    [_btnSet addTarget:self action:@selector(setKeyValue:) forControlEvents:UIControlEventTouchUpInside];
    [v addSubview:_btnSet];
    
    _tv = [[UITextView alloc] init];
    _tv.autoresizesSubviews = YES;
    _tv.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;

    [v addSubview:_tv];

    self.view = v;
    [v release];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(dumpKeyValueStore) userInfo:nil repeats:YES];
}

-(void)setKeyValue:(id)sender {
    NSUbiquitousKeyValueStore *cloudStore = [NSUbiquitousKeyValueStore defaultStore];
    [cloudStore setString:_valueTextField.text forKey:_keyTextField.text];
    [cloudStore synchronize]; // Important as it stores the values you set before on iCloud
    [self dumpKeyValueStore];
    [_valueTextField resignFirstResponder];
}

-(void)dumpKeyValueStore {
    NSUbiquitousKeyValueStore *cloudStore = [NSUbiquitousKeyValueStore defaultStore];
    [cloudStore synchronize];
    NSDictionary *dict = [cloudStore dictionaryRepresentation];
    NSArray *keys = [dict allKeys];
    NSString *output = @"";
    for (NSString *key in keys) {
        id value = [dict valueForKey:key];
        output = [output stringByAppendingFormat:@"%@ = %@\n", key, value];
    }
    _tv.text = output;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CGSize s = self.view.bounds.size;
    _keyTextField.frame = CGRectMake(0, 0, s.width, 44);
    _valueTextField.frame = CGRectMake(0, _keyTextField.frame.size.height, s.width, _keyTextField.frame.size.height);
    
    _btnSet.frame = CGRectMake(0, 88, s.width, 44);
    
    _tv.frame = CGRectMake(0, s.height/2, s.width, s.height/2);
    
    NSUbiquitousKeyValueStore *cloudStore = [NSUbiquitousKeyValueStore defaultStore];
    [cloudStore synchronize]; // Important as it stores the values you set before on iCloud
    
    [self dumpKeyValueStore];
    
    NSURL *baseURL = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:@"XZ493P2355.com.brianpfeil.ScratchApp"];
    NSLog(@"baseURL = %@", baseURL);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
