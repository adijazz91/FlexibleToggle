//
//  ViewController.h
//  Toggle
//
//  Created by Aditya on 02/01/17.
//  Copyright © 2017 AP. All rights reserved.
//

#import "FlexibleToggle.h"
#import <UIKit/UIKit.h>
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel* lblToggleState;
@property (weak, nonatomic) IBOutlet FlexibleToggle* viewFlexibleToggle;

@end
