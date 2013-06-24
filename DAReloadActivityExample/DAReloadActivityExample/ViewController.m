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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
