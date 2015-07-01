//
//  Car.h
//  Day 2 Random Car App
//
//  Created by Sanzhar Askaruly on 6/10/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Car : NSObject
@property (strong, nonatomic) NSString *make;
@property (strong, nonatomic) NSString *make2;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSString *model2;
@property (strong, nonatomic) UIImage *picture;
@property (strong, nonatomic) UIImage *picture2;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *color2;
@property (nonatomic) NSNumber *year;
@property (nonatomic) NSNumber *year2;
@end
