//
//  GrittySandyClayLoamState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "GrittySandyClayLoamState.h"
#import "SandyClayLoamState.h"
#import "NonGrittyClayLoamState.h"

@implementation GrittySandyClayLoamState

-(BaseState *)nextStateForActionYes {
    return [SandyClayLoamState new];
}

-(BaseState *)nextStateForActionNo {
    return [NonGrittyClayLoamState new];
}

@end
