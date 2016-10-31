//
//  StateViewController.h
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseState.h"

/**
 * Base View Controller for all state related view controllers and conforms to UIAlertViewDelegate and UIStateRestoring protocols.
 */
@interface BaseViewController : UIViewController<UIAlertViewDelegate,UIStateRestoring>

/**
 * Property which holds the current state information.
 */
@property (strong, nonatomic) BaseState *state;
/**
 * Pushes the appropriate view controller into the navigation controller for the provided state.
 */
-(void) performSeagueForState:(BaseState *) state;
/**
 * Returns a text aligned NSTextAlignmentJustified NSAttributedString.
 */
-(NSAttributedString *) justifiedAttributedStringForString:(NSString *) string;
/**
 * Do updates to user interface within this method.
 */
-(void) updateUI;

@end
