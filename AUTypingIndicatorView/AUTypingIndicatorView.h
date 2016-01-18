//
//  AUTypingIndicatorView.h
//
//  Created by Hubert Drag on 18.01.2016.
//  Copyright © 2016 Hubert Drag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AUTypingIndicatorView : UIView
// count of visible dotcs
@property (nonatomic, assign) NSUInteger dotsCount;

// space between dots
@property (nonatomic, assign) CGFloat padding;

// dots diameter
@property (nonatomic, assign) CGFloat diameter;

// dots color
@property (nonatomic, strong) UIColor *color;

// animation duration
@property (nonatomic, assign) NSTimeInterval interval;

- (void)startAnimation;
- (void)stopAnimation;
@end
