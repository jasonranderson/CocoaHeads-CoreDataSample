//
//  NSFileManager+MEExtensions.m
//  CoreDataExample
//
//  Created by Jason Anderson on 11/19/14.
//  Copyright (c) 2014 Jason Anderson. All rights reserved.
//

#import "NSFileManager+MEExtensions.h"

@implementation NSFileManager (MEExtensions)

- (NSURL *)ME_applicationSupportDirectoryURL
{
    NSURL *retval = [self URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask].firstObject;
    
    if (![retval checkResourceIsReachableAndReturnError:NULL]) {
        NSError *outError;
        if (![self createDirectoryAtURL:retval withIntermediateDirectories:YES attributes:nil error:&outError])
            NSLog(@"%@",outError);
    }
    
    return retval;
}

@end
