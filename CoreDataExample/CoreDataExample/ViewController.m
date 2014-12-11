//
//  ViewController.m
//  CoreDataExample
//
//  Created by Jason Anderson on 11/19/14.
//  Copyright (c) 2014 Jason Anderson. All rights reserved.
//

#import "ViewController.h"
#import "ModelManager.h"
#import "Word.h"

@interface ViewController () <UITableViewDataSource>

@property (weak,nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *deleteFirstButton;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *deleteAllButton;

@property (strong,nonatomic) NSArray *wordPool;
@property (strong,nonatomic) NSArray *dataSource;

- (void)_refreshDataSource;
- (IBAction)_addWord:(UIBarButtonItem *)sender;
- (IBAction)_deleteFirstWord:(UIBarButtonItem *)sender;
- (IBAction)_deleteAllWords:(UIBarButtonItem *)sender;

@end

@implementation ViewController

- (UIRectEdge)edgesForExtendedLayout
{
    return UIRectEdgeTop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setWordPool:@[@"England", @"Dartmouth", @"CS65", @"is", @"the", @"best", @"coolest", @"place", @"in", @"the", @"universe!"]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self _refreshDataSource];
}

#pragma mark - UITableViewDelegateDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Word *word = [self.dataSource objectAtIndex:indexPath.row];
    [cell.textLabel setText:word.wordText];
    
    return cell;
}

#pragma mark - Private Methods
- (void)_refreshDataSource
{
    [self setDataSource:[[ModelManager sharedManager] fetchWords]];
    [self.tableView reloadData];
}

- (void)_addWord:(UIBarButtonItem *)sender
{
    NSString *wordText = [self.wordPool objectAtIndex:arc4random_uniform((int)self.wordPool.count)];
    [[ModelManager sharedManager] insertWordFromString:wordText];
    [self _refreshDataSource];
}

- (void)_deleteFirstWord:(UIBarButtonItem *)sender
{
    Word *word = [self.dataSource firstObject];
    [[ModelManager sharedManager] deleteWord:word];
    [self _refreshDataSource];
}

- (void)_deleteAllWords:(UIBarButtonItem *)sender
{
    [[ModelManager sharedManager] deleteAllWords];
    [self _refreshDataSource];
}

@end
