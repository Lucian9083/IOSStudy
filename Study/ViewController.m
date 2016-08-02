//
//  ViewController.m
//  Study
//
//  Created by LvZheng on 16/7/20.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController() <UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic, readwrite) NSString * mealName;

@property (weak, nonatomic) IBOutlet UILabel *mealLabel;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation ViewController

/**
 Get method of mealName

 @return the mealName
 */
- (NSString *)mealName{
    
    if(!_mealName){
        _mealName = @"I am a test String";
    }
    return _mealName;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"content: %@",_mealName);
    // synthesize a customize mealName
    [self setMealName:@"I am a synthesize mealName"];
    
    NSLog(@"%@",_mealName);
    
    // 注册代理
    _nameTextField.delegate = self;
    
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)selectFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    //This code ensures that if the user taps the image view while typing in the text field,
    //the keyboard is dismissed properly.
    [_nameTextField resignFirstResponder];
    
    UIImagePickerController *controller = [UIImagePickerController new];
    
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    controller.delegate = self;
    
    [self presentViewController:controller animated:true completion:nil];

}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    
    UIImage *imageView = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    UIImageView *localImageView = _photoImageView;
    
    localImageView.image = imageView;
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}

// 设置键盘特性
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //This code ensures that if the user taps the image view while typing in the text field,
    //the keyboard is dismissed properly.
    [_nameTextField resignFirstResponder];
    
    return false;
}
// 输入结束处理
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    UILabel *localLabel = _mealLabel;
    
    [localLabel setText:textField.text];
    
    textField.text = @"";
}


@end
