//
//  ChartViewController.m
//  NahdiApp
//
//  Created by Saranya Rathinasamy on 14/01/17.
//  Copyright (c) 2017 Saurav  Mishra. All rights reserved.
//

#import "ChartViewController.h"
#import "ChartTableViewCell.h"
#import "XYPieChart.h"

@interface ChartViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)UITableView *chartTableView;
@end

@implementation ChartViewController

-(id)init
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width), ([UIScreen mainScreen].bounds.size.height)/2)];
    [view setBackgroundColor:[UIColor whiteColor]];
    self.view = view;
    [self.view setHidden:NO];
    return [super init];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self loadView];
}
-(void)loadView{
    
    self.chartTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 600) style:UITableViewStylePlain];
    self.chartTableView.delegate= self;
    self.chartTableView.dataSource = self;
    [self.view addSubview:self.chartTableView];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 350;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Warehouse 1";
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ChartTableViewIdentifier";
    ChartTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if(cell==nil)
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ChartTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.userInteractionEnabled = NO;
    cell.slices = [NSMutableArray arrayWithCapacity:10];
    [cell.slices addObjectsFromArray:[[NSArray alloc]initWithObjects:@35,@40,@25, nil]];
    [cell setupChart];
    return cell;
}
@end
