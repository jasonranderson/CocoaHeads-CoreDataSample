//
//  ModelManager.m
//  CoreDataExample
//
//  Created by Jason Anderson on 11/19/14.
//  Copyright (c) 2014 Jason Anderson. All rights reserved.
//

#import "ModelManager.h"
#import "Word.h"
#import "NSFileManager+MEExtensions.h"
#import <CoreData/CoreData.h>

@interface ModelManager ()

@property (strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation ModelManager

- (id)init
{
    if (!(self = [super init]))
        return nil;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataExample" withExtension:@"momd"];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSParameterAssert(model);
    
    [self setPersistentStoreCoordinator:[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model]];
    
    NSURL *applicationSupportDirectoryURL = [[NSFileManager defaultManager] ME_applicationSupportDirectoryURL];
    NSURL *storeURL = [applicationSupportDirectoryURL URLByAppendingPathComponent:@"CoreDataExample.sqlite" isDirectory:NO];
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption : @YES, NSInferMappingModelAutomaticallyOption : @YES};
    
    NSError *outError;
    if (![self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&outError])
        NSLog(@"%@",outError);
    
    [self setManagedObjectContext:[[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType]];
    [self.managedObjectContext setUndoManager:nil];
    [self.managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    
    return self;
}

+ (instancetype)sharedManager
{
    static id retval;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        retval = [[[self class] alloc] init];
    });
    
    return retval;
}

#pragma mark - Public Methods
- (NSArray *)fetchWords
{
    return [self.managedObjectContext executeFetchRequest:[[NSFetchRequest alloc] initWithEntityName:[Word entityName]] error:NULL];
}

- (void)insertWordFromString:(NSString *)string
{
    Word *word = [[Word alloc] initWithEntity:[Word entityInManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [word setWordText:string];
    [self.managedObjectContext save:NULL];
}

- (void)deleteWord:(Word *)word
{
    [self.managedObjectContext deleteObject:word];
    [self.managedObjectContext save:NULL];
}

- (void)deleteAllWords
{
    NSArray *words = [self fetchWords];
    for (Word *word in words) {
        [self deleteWord:word];
    }
}

@end
