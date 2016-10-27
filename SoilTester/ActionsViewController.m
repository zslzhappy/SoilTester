//
//  FSM.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//


#import "BaseViewController.h"
#import "SqueezeIntoBallState.h"
#import "ActionsViewController.h"

@interface ActionsViewController()
@property (weak, nonatomic) IBOutlet UISegmentedControl *uiSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@end

@implementation ActionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.uiLabel setText:[self.state labelString]];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.uiSegmentedControl setSelectedSegmentIndex:UISegmentedControlNoSegment];
}

- (IBAction)segmentedButtonValueChanged:(id)sender {
    State *nextState;
    //Yes
    if (self.uiSegmentedControl.selectedSegmentIndex == 0) {
        //get the next state for action yes
        nextState = [self.state nextStateForActionYes];
    }
    //No
    else if (self.uiSegmentedControl.selectedSegmentIndex == 1){
        //get the next state for action no
        nextState = [self.state nextStateForActionNo];
    }
    [super performSeagueForState:nextState];
}

@end
