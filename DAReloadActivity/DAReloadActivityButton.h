//
//  DAReloadActivityButton.h
//  DAReloadActivity
//
//  Created by Daniel Amitay on 2/6/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAReloadActivityButton : UIButton

@property (nonatomic) CGFloat animationDuration;
@property (nonatomic, getter = isAnimating) BOOL animating;

- (void)startAnimating;
- (void)stopAnimating;
- (void)spin;

@end
