//
//  DisplayCarViewController.m
//  Day 2 Random Car App
//
//  Created by Sanzhar Askaruly on 6/10/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "DisplayCarViewController.h"
#import "Car.h"
#import "ViewController.h"

@interface DisplayCarViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *makeLabel;
@property (strong, nonatomic) IBOutlet UILabel *modelLabel;

@end

@implementation DisplayCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithImage:self.car.picture];
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview:self.imageView];
    
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.1;
    [self setupCar];
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector (rotatePiece:)];
    [self.scrollView addGestureRecognizer:rotationGesture];
    // Do any additional setup after loading the view.
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
-(void)rotatePiece:(UIRotationGestureRecognizer *) gestureRecognizer {
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged){
        [gestureRecognizer view].transform = CGAffineTransformRotate([[gestureRecognizer view] transform],[gestureRecognizer rotation]);
        [gestureRecognizer setRotation:0];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupCar {
    self.makeLabel.text = self.car.make;
    self.modelLabel.text = self.car.model;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
