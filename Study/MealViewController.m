//
//  ViewController.m
//  Study
//
//  Created by LvZheng on 16/7/20.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import "MealViewController.h"
#import "RatingControl.h"

@interface MealViewController() <UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;

@property (strong, nonatomic) IBOutlet RatingControl *ratingControl;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@end




@implementation MealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 注册代理
    _nameTextField.delegate = self;
    
    if(_meal){
        self.navigationItem.title = _meal.name;
        _nameTextField.text = _meal.name;
        _photoImageView.image = _meal.photo;
        _ratingControl.rating = _meal.rating;
    }
    
    [self checkValidMealName];
    
    
    NSLog(@"did load");
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"will appear");
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    NSLog(@"did appear");
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    NSLog(@"will disappear");
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    NSLog(@"did disappear");
    
}

// MARK: navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"prepareForSegue");
    
    if(_saveButton == sender){
        
        NSLog(@"prepareForSegue1");
        
        NSString *name = _nameTextField.text;
        
        int rating = _ratingControl.rating;
        
        UIImage *photo = _photoImageView.image;
        
        _meal = [[Meal alloc] initWithName:name rating:rating photo:photo];
        
    }
}


// MARK: action

- (IBAction)selectFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    //This code ensures that if the user taps the image view while typing in the text field,
    //the keyboard is dismissed properly.
    [_nameTextField resignFirstResponder];
    
    UIImagePickerController *controller = [UIImagePickerController new];
    
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    controller.delegate = self;
    
    [self presentViewController:controller animated:true completion:nil];

}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    
    Boolean isPresentingInAddMealMode = self.presentingViewController && [self.presentingViewController isKindOfClass:[UINavigationController class]];
    
    if(isPresentingInAddMealMode){
        
        [self dismissViewControllerAnimated:true completion:nil];
        
    }else{
        
        [self.navigationController popViewControllerAnimated:true];
        
    }
    
    
}

// MARK: UIImagePickerControllerDelegate


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    
    UIImage *imageView = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    
    _photoImageView.image = imageView;
    
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}



// MARK: UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    _saveButton.enabled = false;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //This code ensures that if the user taps the image view while typing in the text field,
    //the keyboard is dismissed properly.
    [_nameTextField resignFirstResponder];
    
    return false;
}
// 输入结束处理
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self checkValidMealName];
    
    self.navigationItem.title = textField.text;
    
}

- (void)checkValidMealName{
    
    NSString *mealName = _nameTextField.text;
    
    Boolean isValid = mealName != nil && ![mealName isEqualToString:@""];
    
    _saveButton.enabled = isValid;
}


@end
