//
//  FlexibleToggle.m
//  FlexibleToggle
//
//  Created by Aditya on 20/12/16.
//  Copyright © 2016 Aditya. All rights reserved.
//

#import "FlexibleToggle.h"

@implementation FlexibleToggle
@synthesize currentToggleState;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // load view frame XIB
        [self commonSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // load view frame XIB
        [self commonSetup];
    }
    return self;
}
#pragma mark - setup view

- (UIView*)loadViewFromNib
{
    NSBundle* bundle = [NSBundle bundleForClass:[self class]];

    //  An exception will be thrown if the xib file with this class name not found,
    UIView* view = [[bundle loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    return view;
}
- (void)commonSetup
{

    UIView* nibView = [self loadViewFromNib];
    nibView.frame = self.bounds;
    // the autoresizingMask will be converted to constraints, the frame will match the parent view frame
    nibView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    // Adding nibView on the top of our view
    [self addSubview:nibView];

    _btnToggle.backgroundColor = [UIColor whiteColor];
    [_btnToggle setSelected:YES];
    [_imgToggle setImage:[UIImage imageNamed:@""]];
    _imgToggle.clipsToBounds = YES;
    [self setToggleOn];
    currentToggleState = 1; //Active State
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setToggleOn];

    self.layer.cornerRadius = 15.0;
    _btnToggle.layer.cornerRadius = 15.0;
}
- (IBAction)buttonToggle:(id)sender
{
    if ([_btnToggle isSelected]) {

        [self setToggleOff];
    }
    else {

        [self setToggleOn];
    }
}
- (void)setToggleOn
{
    [self layoutIfNeeded];
    currentToggleState = 1; // Current State

    [UIView animateWithDuration:0.2 animations:^{
        _btnToggleLeadingConstraint.constant = CGRectGetWidth(self.bounds) - 30.0;
        _lblToggleStateCentreXConstraint.constant = -10;
        [self layoutIfNeeded];
    }];

    self.backgroundColor = [UIColor clearColor];
    _lblToggleState.text = @"ON";
    _lblToggleState.textColor = [UIColor whiteColor];
    _lblToggleState.textAlignment = NSTextAlignmentCenter;
    [_btnToggle setSelected:YES];

    self.backgroundColor = [UIColor colorWithRed:44.0 / 255 green:191.0 / 255.0 blue:123.0 / 255.0 alpha:1.0];
}
- (void)setToggleOff
{
    [self layoutIfNeeded];
    currentToggleState = 0; // Current State

    [UIView animateWithDuration:0.2 animations:^{
        _btnToggleLeadingConstraint.constant = 0;
        _lblToggleStateCentreXConstraint.constant = 5;
        [self layoutIfNeeded];
    }];

    self.backgroundColor = [UIColor clearColor];
    _lblToggleState.text = @"  OFF";
    _lblToggleState.textColor = [UIColor whiteColor];
    _lblToggleState.textAlignment = NSTextAlignmentCenter;
    [_btnToggle setSelected:NO];

    self.backgroundColor = [UIColor colorWithRed:252.0 / 255.0 green:86.0 / 255.0 blue:67.0 / 255.0 alpha:1.0];
}
@end