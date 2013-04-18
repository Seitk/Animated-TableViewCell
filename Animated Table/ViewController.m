//
//  ViewController.m
//  Animated Table
//
//  Created by Philip Yu on 4/17/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell1.h"
#import "UIView+Positioning.h"

#define tableViewCellHeight 90

@interface ViewController ()

@end

@implementation ViewController
@synthesize table = _table;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect screenFrame = [[UIScreen mainScreen] bounds];
    
    UIBarButtonItem *btnReset = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(replayAnimation)];
    self.navigationItem.rightBarButtonItem = btnReset;
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenFrame.size.width, screenFrame.size.height) style:UITableViewStylePlain];
    _table.dataSource = self;
    _table.delegate = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_table];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark TableView DataSource Methods

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    CustomCell1 *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell configureCellContentSizeWidth:tableView.frame.size.width height:tableViewCellHeight];
    }
    
    [cell resetPosition];
    
    // Trigger tableView didLoad and then start animation
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        // Show once only
        if (!tableAnimated) [self startTableViewAnimation:tableView];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell1 *selectedCell = (CustomCell1 *)[tableView cellForRowAtIndexPath:indexPath];
    [selectedCell popCellWithAnimation:YES];
}

- (void) startTableViewAnimation:(UITableView *)table
{
    tableAnimated = YES;
    for (AnimatedTableCell *atCell in table.visibleCells) {
        if ([table.visibleCells indexOfObject:atCell] % 2 == 0)
            [atCell pushCellWithAnimation:YES direction:@"left"];
        else
            [atCell pushCellWithAnimation:YES direction:@"right"];
    }
}

- (void) replayAnimation
{
    [self startTableViewAnimation:_table];
}

#pragma mark -
#pragma mark TableView Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableViewCellHeight;
}

@end
