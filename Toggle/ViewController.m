//
//  ViewController.m
//  Toggle
//
//  Created by Aditya on 02/01/17.
//  Copyright © 2017 AP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    FlexibleToggle* flexibleToggle;
}

@end

@implementation ViewController
@synthesize viewFlexibleToggle;
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor colorWithRed:18.0 / 255.0 green:140.0 / 255.0 blue:215.0 / 255. alpha:1.0]]; //self.view Background color
    self.lblToggleState.text = @"ON: State"; //Toggle Intial state text to be ON

    [self addFlexibleToggle:viewFlexibleToggle]; //Toggle Intialization
}
#pragma mark----------Flexible Toggle Method---------
- (void)addFlexibleToggle:(UIView*)v
{

    [viewFlexibleToggle setBackgroundColor:[UIColor clearColor]];
    flexibleToggle = [[FlexibleToggle alloc] init];
    flexibleToggle.translatesAutoresizingMaskIntoConstraints = NO;

    [viewFlexibleToggle addSubview:flexibleToggle];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:flexibleToggle
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:viewFlexibleToggle
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:flexibleToggle
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:viewFlexibleToggle
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:flexibleToggle
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:viewFlexibleToggle
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:flexibleToggle
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:viewFlexibleToggle
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.]];

    [flexibleToggle setToggleOn]; //Toggle Intial state is "ON"

    UITapGestureRecognizer* gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggelIt:)]; //Tap Gesture to change the state

    [viewFlexibleToggle addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
    gestureRecognizer.numberOfTouchesRequired = 1;
}
#pragma mark----- Tap Gesture Method on toggle View---
- (void)toggelIt:(id)sender
{

    NSLog(@"Current State of the Toggle ---> %ld", flexibleToggle.currentToggleState);
    if ([flexibleToggle.btnToggle isSelected]) {
        [flexibleToggle setToggleOff]; //Toggle Intial state is "OFF"
        NSLog(@"Current State of the Toggle ---> %ld", flexibleToggle.currentToggleState);
        //Animation block to perform any fade in-out task
        //fade in
        [UIView animateWithDuration:2.0f animations:^{

        }
            completion:^(BOOL finished) {

                //fade out
                [self.view setBackgroundColor:[UIColor colorWithRed:101.0 / 255.0 green:94.0 / 255.0 blue:102.0 / 255.0 alpha:1.0]];
                self.lblToggleState.text = @"OFF: State";

            }];
    }
    else {
        [flexibleToggle setToggleOn]; //Toggle Intial state is "ON"
        NSLog(@"Current State of the Toggle ---> %ld", flexibleToggle.currentToggleState);
        //fade in
        [UIView animateWithDuration:2.0f animations:^{

        }
            completion:^(BOOL finished) {

                //fade out
                [self.view setBackgroundColor:[UIColor colorWithRed:18.0 / 255.0 green:140.0 / 255.0 blue:215.0 / 255. alpha:1.0]];
                self.lblToggleState.text = @"ON: State";

            }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
