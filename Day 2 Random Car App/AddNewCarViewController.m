//
//  AddNewCarViewController.m
//  Day 2 Random Car App
//
//  Created by Sanzhar Askaruly on 6/10/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "AddNewCarViewController.h"
#import "Car.h"

@interface AddNewCarViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *makeTextField;
@property (strong, nonatomic) IBOutlet UITextField *modelTextField;
@property (strong, nonatomic) IBOutlet UITextField *yearTextField;
@property (strong, nonatomic) IBOutlet UITextField *colorTextField;
@property (strong, nonatomic) IBOutlet UIImageView *carImageView;
@property (strong, nonatomic) IBOutlet UIButton *addButtonPressed;
@property (strong, nonatomic) IBOutlet UIButton *cancelButtonPressed;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerYear;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerColor;
@property (strong, nonatomic) NSArray *pickerYearData;
@property (strong, nonatomic) NSArray *pickerColorData;
@property (strong, nonatomic) NSString *colorTemp;
@property (strong, nonatomic) NSString *intTemp;


@end

@implementation AddNewCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.carImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageViewTap:)];

    self.pickerColorData = @[@"blue", @"yellow", @"red", @"greem", @"grey"];
    self.pickerYearData = @[@"1954", @"1999", @"2002", @"2010", @"2015"];
    [self.carImageView addGestureRecognizer:singleTapRecognizer];
    self.pickerColor.dataSource=self;
    self.pickerColor.delegate=self;
    
    self.pickerYear.dataSource=self;
    self.pickerYear.delegate=self;

}




- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


// returns the # of rows in each component..

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView.tag == 0 ){
        return [self.pickerColorData count];
    } else {
        return [self.pickerYearData count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView.tag == 0 )
        return [self.pickerColorData objectAtIndex:row];
    else
        return [self.pickerYearData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView.tag == 0 ){
        self.colorTemp=[self.pickerColorData objectAtIndex:row];
    } else{
        self.intTemp=[self.pickerYearData objectAtIndex:row];
        //   return [self.yearsArray objectAtIndex:row];
    }
    
}

- (IBAction)addButtonPressed:(id)sender {
    Car *newCar = [Car new];
    newCar.make = self.makeTextField.text;
    newCar.model = self.modelTextField.text;
    newCar.picture = self.carImageView.image;
    //NSString *year = self.yearTextField.text;
    NSNumberFormatter *formatString = [[NSNumberFormatter alloc] init];
    newCar.year = [formatString numberFromString:self.intTemp];
    newCar.color = self.colorTemp;
    [self.delegate didAddCar:newCar];
}
- (IBAction)cancelButtonPressed:(id)sender {
    [self.delegate didCancel];
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
