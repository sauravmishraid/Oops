//
//  LocationsViewController.m
//  NahdiApp
//
//  Created by Saurav  Mishra on 14/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import "LocationsViewController.h"
@import MapKit;

@interface LocationsViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) NSMutableArray *annotation;
@end

@implementation LocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.annotation = [NSMutableArray new];
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    
    MKCoordinateRegion region = self.mapView.region;

    region.center = CLLocationCoordinate2DMake(24.7422798, 46.8393318);
    
    region.span.longitudeDelta /= 200.0; // Bigger the value, closer the map view
    region.span.latitudeDelta /= 200.0;
    [self.mapView setRegion:region animated:YES]; // Choose if you want animate or not

    MKPointAnnotation *mappin;
    
    CLLocationCoordinate2D location;
    
    location = CLLocationCoordinate2DMake(24.7422798,46.6709438);
    mappin = [[MKPointAnnotation alloc]init];
    mappin.coordinate=location;
    mappin.title=@"Al nahdi pharmacy";
    mappin.subtitle=@"Prince Ahmad Ibn Abdulaziz, King Fahd, Riyadh";
    [self.annotation addObject:mappin];
    
    mappin = [[MKPointAnnotation alloc]init];
    location = CLLocationCoordinate2DMake(24.7449153,46.8393318);
    mappin.coordinate=location;
    mappin.title=@"Al nahdi pharmacy";
    mappin.subtitle=@"Az Zubair Ibn Al Awam, As Salam, Riyadh";
    [self.annotation addObject:mappin];
    
    mappin = [[MKPointAnnotation alloc]init];
    location = CLLocationCoordinate2DMake(24.742823,46.823945);
    mappin.coordinate=location;
    mappin.title=@"Al nahdi pharmacy";
    mappin.subtitle=@"Hassan Ibn Thabit, An Nasim Al Gharbi, Riyadh";
    
   
    
    [self.annotation addObject:mappin];
    
    [self.mapView addAnnotations:self.annotation];

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
 }

- (IBAction)BackButtonTapped:(UIButton *)sender {
    
    
    if(self.presentingViewController)
        [self dismissViewControllerAnimated:YES completion:nil];
    else
        [self.navigationController popViewControllerAnimated:YES];
    
}
@end
