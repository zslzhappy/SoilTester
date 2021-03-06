//
//  Persistence.m
//  SoilTester
//
//  Created by Navaneet Sarma on 30/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "Persistence.h"
#import "BaseState.h"

/**
 * Key used for serializing state data.
 */
#define ARCHIVER_KEY @"states"

@implementation Persistence

+(BOOL) persistToState:(BaseState *)state fromState:(BaseState *)previousState {
    //persist viewcontroller states for actions performed.
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *array = [[defaults arrayForKey:ARCHIVER_KEY] mutableCopy];
        if (!array) {
            array = [[NSMutableArray alloc]init];
        }
        BaseState *actualState = [previousState copy];
        actualState.action = state.action;
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:actualState];
       //NSLog(@"inserted %@", actualState);
        [array addObject:data];
        [defaults setObject:array forKey:ARCHIVER_KEY];
        return [defaults synchronize];
}

+(BOOL)removeLastObjectFromPersistantStore {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *array = [[defaults arrayForKey:ARCHIVER_KEY] mutableCopy];
    if (array !=nil) {
    //BaseState *state = [NSKeyedUnarchiver unarchiveObjectWithData:[array lastObject]];
    //NSLog(@"removed %@", state);
    [array removeLastObject];
    [defaults setObject:array forKey:ARCHIVER_KEY];
    return [defaults synchronize];
    }
    return NO;
}

+(BOOL)persistStateArray:(NSArray *)array {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:array forKey:ARCHIVER_KEY];
    return [defaults synchronize];
}

+(BOOL)clearAllData {
    //clear the standard defaults.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:ARCHIVER_KEY];
    return [defaults synchronize];

}

+(NSArray *)dataFromPersistenceStore {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults arrayForKey:ARCHIVER_KEY] mutableCopy];
}

@end
