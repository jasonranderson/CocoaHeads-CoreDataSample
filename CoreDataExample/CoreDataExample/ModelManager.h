//
//  ModelManager.h
//  CoreDataExample
//
//  Created by Jason Anderson on 11/19/14.
//  Copyright (c) 2014 Jason Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Word;

@interface ModelManager : NSObject

+ (instancetype)sharedManager;

- (NSArray *)fetchWords;
- (void)insertWordFromString:(NSString *)string;
- (void)deleteWord:(Word *)word;
- (void)deleteAllWords;

@end
