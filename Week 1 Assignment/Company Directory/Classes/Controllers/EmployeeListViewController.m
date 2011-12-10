//
//  EmployeeListViewController.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "EmployeeListViewController.h"
#import "Employee.h"
#import "EmployeeViewController.h"

@implementation EmployeeListViewController
@synthesize employees;

- (void)dealloc {
  [employees release];
  [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //shouldn't this be initialized in the constructor?
    self.employees = [Employee sampleListOfEmployees];
    self.title = NSLocalizedString(@"Company Directory", nil);
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [employees count]; // @todo Return a number of cells based on the employees array
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[employees objectAtIndex:[indexPath row]] name];
    cell.detailTextLabel.text = [[employees objectAtIndex:[indexPath row]] title];
        
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // @todo Create and push a new view configured for the corresponding employee
  EmployeeViewController *v=[[EmployeeViewController alloc] initWithStyle:UITableViewStyleGrouped];
  [v setMyEmployee:[employees objectAtIndex:[indexPath row]]]; 
  [self.navigationController pushViewController:v  animated:true];
}

@end
