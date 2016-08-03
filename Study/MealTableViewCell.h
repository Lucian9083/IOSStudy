//
//  MealTableViewCell.h
//  Study
//
//  Created by LvZheng on 16/8/3.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"

@interface MealTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *name;

@property (strong, nonatomic) IBOutlet UIImageView *photo;

@property (strong, nonatomic) IBOutlet RatingControl *rating;


@end
