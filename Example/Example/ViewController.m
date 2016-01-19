//
//  ViewController.m
//  Example
//
//  Created by Emil Wojtaszek on 18.01.2016.
//  Copyright © 2016 AppUnite.com. All rights reserved.
//

#import "ViewController.h"

//
#import "AUTypingIndicatorView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet AUTypingIndicatorView *typingView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //
    [self.typingView startAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.typingView stopAnimation];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
