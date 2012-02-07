//
//  DAReloadActivityButton.m
//  DAReloadActivity
//
//  Created by Daniel Amitay on 2/6/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "DAReloadActivityButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation DAReloadActivityButton

@synthesize animationDuration =_animationDuration;

#pragma mark - Init Methods

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 28, 28)];
    if (self)
    {
        self.showsTouchWhenHighlighted = YES;
        [self setBackgroundImage:[UIImage imageNamed:@"reload"] forState:UIControlStateNormal];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.showsTouchWhenHighlighted = YES;
        [self setBackgroundImage:[UIImage imageNamed:@"reload"] forState:UIControlStateNormal];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.showsTouchWhenHighlighted = YES;
        [self setBackgroundImage:[UIImage imageNamed:@"reload"] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark - Public Methods

- (BOOL)isAnimating
{
    CAAnimation *spinAnimation = [self.layer animationForKey:@"spinAnimation"];
    return (animating || spinAnimation);
}

- (void)startAnimating
{
    animating = YES;
    [self spin];
}

- (void)stopAnimating
{
    animating = NO;
}

- (void)spin
{
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.byValue = [NSNumber numberWithFloat:2*M_PI];
    spinAnimation.duration = self.animationDuration;
    spinAnimation.delegate = self;
    [self.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
}

#pragma mark - Animation Delegates

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    if (animating)
    {
        [self spin];
    }
}

#pragma mark - Property Methods

- (CGFloat)animationDuration
{
    if (!_animationDuration)
    {
        _animationDuration = 1.0f;
    }
    return _animationDuration;
}

@end
