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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
