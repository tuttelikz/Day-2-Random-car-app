//
//  DisplayCarViewController.h
//  Day 2 Random Car App
//
//  Created by Sanzhar Askaruly on 6/10/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface DisplayCarViewController : UIViewController
@property (strong, nonatomic) Car *car;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
