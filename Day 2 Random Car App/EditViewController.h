//
//  EditViewController.h
//  Day 2 Random Car App
//
//  Created by Sanzhar Askaruly on 6/10/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
@protocol EditViewController <NSObject>
-(void) didEditCar: (Car *) editedCar;
-(void) didEditCancel;
@end

@interface EditViewController : UIViewController
@property (strong, nonatomic) Car *car;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak) id<EditViewController> delegate;
@end
