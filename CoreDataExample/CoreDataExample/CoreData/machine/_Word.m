// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Word.m instead.

#import "_Word.h"

const struct WordAttributes WordAttributes = {
	.wordText = @"wordText",
};

@implementation WordID
@end

@implementation _Word

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Word";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Word" inManagedObjectContext:moc_];
}

- (WordID*)objectID {
	return (WordID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic wordText;

@end

