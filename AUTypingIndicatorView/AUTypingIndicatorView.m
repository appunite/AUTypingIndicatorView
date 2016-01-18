//
//  AUTypingIndicatorView.m
//
//  Created by Hubert Drag on 18.01.2016.
//  Copyright © 2016 Hubert Drag. All rights reserved.
//

#import "AUTypingIndicatorView.h"

@implementation AUTypingIndicatorView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupDefaultValues];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultValues];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupDefaultValues];
}

- (void)setupDefaultValues {
    
    self.diameter = 2.0f;
    self.dotsCount = 3;
    self.padding = 4.0f;
    self.color = [UIColor colorWithRed:47.0f / 255.0f green:146.0f / 255.0f blue:229.0f / 255.0f alpha:1.0f];
    self.interval = 1.8f;
}

- (void)startAnimation {
    
    // dot layer
    CALayer *dotLayer = [CALayer layer];
    dotLayer.frame = CGRectMake(0.0f, CGRectGetMidY(self.bounds) - self.diameter * 0.5f, self.diameter, self.diameter);
    dotLayer.cornerRadius = self.diameter * 0.5f;
    dotLayer.position = CGPointZero;
    dotLayer.backgroundColor = self.color.CGColor;
    dotLayer.opacity = 1.0f;
    
    CAReplicatorLayer *dotReplicator = [CAReplicatorLayer layer];
    [dotReplicator setBounds:self.bounds];
    [dotReplicator setBackgroundColor:[UIColor clearColor].CGColor];
    [dotReplicator setPosition:CGPointZero];
    
    // translation transform
    CATransform3D translationTransform = CATransform3DTranslate(dotLayer.transform, self.padding, 0, 0);
    [dotReplicator setInstanceCount:self.dotsCount];
    [dotReplicator setInstanceTransform:translationTransform];
    [dotReplicator setInstanceDelay:self.interval / self.dotsCount];
    
    // add layers
    [dotReplicator addSublayer:dotLayer];
    [self.layer addSublayer:dotReplicator];
    
    // setup animations
    
    // fade animaiton
    CABasicAnimation *fadeAnimation = [CABasicAnimation animation];
    fadeAnimation.fromValue = @(1.0f);
    fadeAnimation.toValue = @(0.0f);

    // scale animation
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.values = @[
      [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 0.0f)],
      [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5f, 1.5f, 0.0f)],
      [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.0f, 2.0f, 0.0f)],
      [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5f, 1.5f, 0.0f)],
      [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 0.0f)],
    ];
    
    // group animation
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    groupAnimation.repeatCount = HUGE_VALF;
    groupAnimation.duration = self.interval;
    groupAnimation.animations = @[fadeAnimation, scaleAnimation];
    
    // add animation to layer
    [dotLayer addAnimation:groupAnimation forKey:@"animation"];
}

- (void)stopAnimation {
    // TODO:
}

@end
