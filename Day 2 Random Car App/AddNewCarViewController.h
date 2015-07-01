//
//  AddNewCarViewController.h
//  Day 2 Random Car App
//
//  Created by Sanzhar Askaruly on 6/10/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
@protocol AddNewCarViewController <NSObject, UINavigationBarDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
-(void) didAddCar: (Car *) newCar;
-(void) didCancel;
@end

@interface AddNewCarViewController : UIViewController
@property (weak) id<AddNewCarViewController> delegate;

@end
