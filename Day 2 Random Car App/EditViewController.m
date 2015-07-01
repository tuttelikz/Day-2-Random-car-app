//
//  EditViewController.m
//  Day 2 Random Car App
//
//  Created by Sanzhar Askaruly on 6/10/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "EditViewController.h"
#import "DisplayCarViewController.h"
#import "Car.h"
#import "ViewController.h"



@interface EditViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *carImageView;
@property (strong, nonatomic) IBOutlet UIButton *editButtonPressed;
@property (strong, nonatomic) IBOutlet UIButton *cancelButtonPressed;
@property (strong, nonatomic) IBOutlet UITextField *makeTextField;
@property (strong, nonatomic) IBOutlet UITextField *modelTextField;
@property (strong, nonatomic) IBOutlet UITextField *yearTextField;
@property (strong, nonatomic) NSNumber *year;
@property (strong, nonatomic) IBOutlet UITextField *colorTextField;


@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = self.car.picture;
    
    self.carImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageViewTap:)];
    [self.carImageView addGestureRecognizer:singleTapRecognizer];

    
}


- (IBAction)editButtonPressed:(id)sender {
    self.car.make = self.makeTextField.text;
    self.car.model = self.modelTextField.text;
    self.car.picture = self.carImageView.image;
    self.car.year = [NSNumber numberWithInt:[self.year intValue]];
    self.car.color = self.colorTextField.text;
    [self.delegate didEditCar:self.car];
}
- (IBAction)cancelButtonPressed:(id)sender {
    [self.delegate didEditCancel];
}


-(void) handleImageViewTap: (UITapGestureRecognizer *) tapGestureRecognizer {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if (!image) image = info[UIImagePickerControllerEditedImage];
    self.carImageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
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
