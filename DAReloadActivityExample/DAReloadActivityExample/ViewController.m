//
//  ViewController.m
//  DAReloadActivityExample
//
//  Created by Daniel Amitay on 2/6/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize navigationBarItem;
@synthesize viewButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    navigationBarItem = [[DAReloadActivityButton alloc] init];
    navigationBarItem.showsTouchWhenHighlighted = NO;
    [navigationBarItem addTarget:self action:@selector(animate:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navigationBarItem];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    viewButton = [[DAReloadActivityButton alloc] init];
    [viewButton addTarget:self action:@selector(animate:) forControlEvents:UIControlEventTouchUpInside];
    viewButton.center = CGPointMake(160, 176);
    viewButton.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                   UIViewAutoresizingFlexibleBottomMargin |
                                   UIViewAutoresizingFlexibleLeftMargin |
                                   UIViewAutoresizingFlexibleRightMargin);
    [self.view addSubview:viewButton];
}

- (void)animate:(DAReloadActivityButton *)button
{
    if(button == navigationBarItem)
    {
        [button spin];
    }
    else
    {
        if ([button isAnimating])
        {
            [button stopAnimating];
        }
        else
        {
            [button startAnimating];
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
