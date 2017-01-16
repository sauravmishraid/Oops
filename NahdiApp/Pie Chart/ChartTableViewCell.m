//
//  ChartTableViewself.m
//  NahdiApp
//
//  Created by Saranya Rathinasamy on 14/01/17.
//  Copyright (c) 2017 Saurav  Mishra. All rights reserved.
//

#import "ChartTableViewCell.h"

@implementation ChartTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.pieChart setDataSource:self];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupChart
{
    [self.pieChart setAnimationSpeed:1.0];
    [self.pieChart setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    [self.pieChart setLabelRadius:70];
    [self.pieChart setShowPercentage:YES];
    [self.pieChart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChart setPieCenter:CGPointMake(([UIScreen mainScreen].bounds.size.width)/2 - 10, self.contentView.frame.size.height/2 - 50)];
    [self.pieChart setUserInteractionEnabled:NO];
    [self.pieChart setLabelShadowColor:[UIColor blackColor]];
    
    self.percentageLabel = [[UILabel alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/2 - 25, ([UIScreen mainScreen].bounds.size.height)/2 - 25, 50, 50)];
    self.percentageLabel.text = @"%";
    self.percentageLabel.textAlignment = NSTextAlignmentCenter;
    self.percentageLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:40.0];
    [self.percentageLabel setBackgroundColor:[UIColor whiteColor]];
    [self.percentageLabel.layer setCornerRadius:20.0];
    self.percentageLabel.clipsToBounds = YES;
    self.percentageLabel.center = CGPointMake(([UIScreen mainScreen].bounds.size.width)/2 - 10, self.contentView.frame.size.height/2 - 50);
    [self.pieChart addSubview:self.percentageLabel];
    
    NSMutableArray *kpiScore = [[NSMutableArray alloc]init];
    for (int i=0; i<self.slices.count; i++) {
        [kpiScore addObject:[NSString stringWithFormat:@"KPI%d = %@%@",i+1,[self.slices objectAtIndex:i],@"%"]];
    }
    self.titleLabel.text = [kpiScore componentsJoinedByString:@"  "];

    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
    [self.pieChart reloadInputViews];
    [self.pieChart reloadData];

}
#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

@end
