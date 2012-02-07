//
//  DAReloadActivityButton.h
//  DAReloadActivity
//
//  Created by Daniel Amitay on 2/6/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAReloadActivityButton : UIButton
{
    BOOL animating;
}
@property (nonatomic) CGFloat animationDuration;

- (BOOL)isAnimating;
- (void)startAnimating;
- (void)stopAnimating;
- (void)spin;

@end
