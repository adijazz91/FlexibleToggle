//
//  FlexibleToggle.h
//  FlexibleToggle
//
//  Created by Aditya on 20/12/16.
//  Copyright © 2016 Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlexibleToggle : UIView
@property (weak, nonatomic) IBOutlet UIImageView* imgToggle; //To Play With background ImageView

@property (weak, nonatomic) IBOutlet UIButton* btnToggle; //Button outlet to perfrom changes
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* btnToggleLeadingConstraint; // Leading Constraint to change the animavtion effect of the button from one end to another
- (IBAction)buttonToggle:(id)sender; //Botton toggle action in case if, gestures is not needed.

@property (weak, nonatomic) IBOutlet UILabel* lblToggleState; //On, Off curretn state of the toggle
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* lblToggleStateCentreXConstraint;

@property (nonatomic, readonly) NSInteger currentToggleState; //state - '0' means InActive and state - '1' means Active, default value is Active - '1'

- (void)setToggleOn; //Global method to perfrom 'On' state.
- (void)setToggleOff; //Global method to perfrom 'Off' state.

@end
