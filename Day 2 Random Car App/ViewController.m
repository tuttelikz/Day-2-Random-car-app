//
//  ViewController.m
//  Day 2 Random Car App
//
//  Created by Sanzhar Askaruly on 6/10/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "AddNewCarViewController.h"
#import "DisplayCarViewController.h"
#import "EditViewController.h"

@interface ViewController () <AddNewCarViewController>
@property (strong, nonatomic) IBOutlet UIImageView *carImageView;
@property (strong, nonatomic) IBOutlet UILabel *makeLabel;
@property (strong, nonatomic) IBOutlet UILabel *modelLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UILabel *colorLabel;
@property (strong, nonatomic) NSMutableArray *cars;
@property (nonatomic) unsigned int currentCarIndex;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property (nonatomic) Car *segueCar;
@property (strong, nonatomic) IBOutlet UIImageView *car2ImageView;
@property (strong, nonatomic) IBOutlet UILabel *make2Label;
@property (strong, nonatomic) IBOutlet UILabel *mode2Label;
@property (strong, nonatomic) IBOutlet UILabel *year2Label;
@property (strong, nonatomic) IBOutlet UILabel *color2Label;
@property (nonatomic) unsigned int currentCar2Index;
@property (strong, nonatomic) IBOutlet UIButton *delete2Button;
@property (strong, nonatomic) IBOutlet UIButton *edit2Button;

@end

@implementation ViewController
- (IBAction)nextButtonPressed:(id)sender {
    self.currentCarIndex = random() % self.cars.count;
    [self setupCar];
}

- (IBAction)next2ButtonPressed:(id)sender {
    self.currentCar2Index = random() % self.cars.count; ///?????
    [self setupCar2];
}
-(void) setupCar {
    Car *car = self.cars[self.currentCarIndex];
    self.carImageView.image = car.picture;
    self.makeLabel.text = car.make;
    self.modelLabel.text = car.model;
    self.yearLabel.text = [NSString stringWithFormat: @"%@", car.year];
    self.colorLabel.text = car.color;
    
    self.carImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageViewTap:)];
    [self.carImageView addGestureRecognizer:singleTapRecognizer];
}
-(void) setupCar2 {
    Car *car2 = self.cars[self.currentCar2Index];
    self.car2ImageView.image = car2.picture2;
    self.make2Label.text = car2.make2;
    self.mode2Label.text = car2.model2;
    self.year2Label.text = [NSString stringWithFormat: @"%@", car2.year2];
    self.color2Label.text = car2.color2;
    
    self.car2ImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageViewTap2:)];
    [self.car2ImageView addGestureRecognizer:singleTapRecognizer2];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Car *car1 = [Car new];
    car1.make = @"BMW";
    car1.make2 = @"BMW";
    car1.model = @"X6";
    car1.model2 = @"X6";
    car1.picture = [UIImage imageNamed:@"bmw.jpg"];
    car1.picture2 = [UIImage imageNamed:@"bmw.jpg"];
    car1.year = @1993;
    car1.year2 = @1993;
    car1.color = @"black";
    car1.color2 = @"black";
    
    Car *car2 = [Car new];
    car2.make = @"Mercedes";
    car2.make2 = @"Mercedes";
    car2.model = @"S class";
    car2.model2 = @"S class";
    car2.picture = [UIImage imageNamed:@"mercedes.jpg"];
    car2.picture2 = [UIImage imageNamed:@"mercedes.jpg"];
    car2.year = @1995;
    car2.year2 = @1995;
    car2.color = @"blue";
    car2.color2 = @"blue";
    
    Car *car3 = [Car new];
    car3.make = @"Lexus";
    car3.make2 = @"Lexus";
    car3.model = @"LX 570";
    car3.model2 = @"LX 570";
    car3.picture = [UIImage imageNamed:@"lexus.jpg"];
    car3.picture2 = [UIImage imageNamed:@"lexus.jpg"];
    car3.year = @2000;
    car3.year2 = @2000;
    car3.color = @"red";
    car3.color2 = @"red";
    
    Car *car4 = [Car new];
    car4.make = @"Toyota";
    car4.model = @"Sequoia";
    car4.picture = [UIImage imageNamed:@"toyota.jpg"];
    car4.year = @2015;
    car4.color = @"black";
    car4.make2 = @"Toyota";
    car4.model2 = @"Sequoia";
    car4.picture2 = [UIImage imageNamed:@"toyota.jpg"];
    car4.year2 = @2015;
    car4.color2 = @"black";
    
    Car *car5 = [Car new];
    car5.make =car5.make = @"Audi";
    car5.model = @"A8";
    car5.picture = [UIImage imageNamed:@"audi.jpg"];
    car5.year = @2010;
    car5.color = @"orange";
    car5.make2 =car5.make = @"Audi";
    car5.model2 = @"A8";
    car5.picture2 = [UIImage imageNamed:@"audi.jpg"];
    car5.year2 = @2010;
    car5.color2 = @"orange";
    
    self.cars = [[NSMutableArray alloc] initWithObjects:car1, car2, car3, car4, car5, nil];
    self.currentCarIndex = 0;
    self.currentCar2Index = 0;
    [self setupCar];
    [self setupCar2];
}






-(void) didAddCar:(Car *)newCar {
    [self.cars addObject:newCar];
    self.currentCarIndex = self.cars.count - 1;
    [self setupCar];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) didEditCar:(Car *)newCar {
    [self.cars replaceObjectAtIndex:self.currentCarIndex withObject:newCar];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) didEditCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) didCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)deletePressed:(id)sender {
    [self.cars removeObjectAtIndex:(self.currentCarIndex)];
    [self setupCar];
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[AddNewCarViewController class]])
    {
        AddNewCarViewController *nextVC = segue.destinationViewController;
        nextVC.delegate = self;
    }
    if ([segue.destinationViewController isKindOfClass:[DisplayCarViewController class]]) {
        DisplayCarViewController *nextVC = segue.destinationViewController;
        nextVC.car = self.segueCar; 
    }
    if ([segue.destinationViewController isKindOfClass:[EditViewController class]]) {
        EditViewController *nextVX = segue.destinationViewController;
        nextVX.car = self.cars[self.currentCarIndex];
    }
}




-(void)handleImageViewTap: (UITapGestureRecognizer *) tapGestureRecognizer {
    self.segueCar = self.cars[self.currentCarIndex];
    [self performSegueWithIdentifier:@"Display" sender:self];
}
-(void)handleImageViewTap2: (UITapGestureRecognizer *) tapGestureRecognizer {
    self.segueCar = self.cars[self.currentCar2Index];
    [self performSegueWithIdentifier:@"Display" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
