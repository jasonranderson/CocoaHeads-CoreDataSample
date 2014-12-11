// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Word.h instead.

#import <CoreData/CoreData.h>

extern const struct WordAttributes {
	__unsafe_unretained NSString *wordText;
} WordAttributes;

@interface WordID : NSManagedObjectID {}
@end

@interface _Word : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WordID* objectID;

@property (nonatomic, strong) NSString* wordText;

//- (BOOL)validateWordText:(id*)value_ error:(NSError**)error_;

@end

@interface _Word (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveWordText;
- (void)setPrimitiveWordText:(NSString*)value;

@end
