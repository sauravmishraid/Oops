//
//  ChartTableViewCell.h
//  NahdiApp
//
//  Created by Saranya Rathinasamy on 14/01/17.
//  Copyright (c) 2017 Saurav  Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@interface ChartTableViewCell : UITableViewCell<XYPieChartDataSource>
@property (strong, nonatomic) IBOutlet XYPieChart *pieChart;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) UILabel *percentageLabel;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;
-(void)setupChart;
@end
