//
//  Meal.h
//  Study
//
//  Created by LvZheng on 16/8/3.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Meal : NSObject <NSCoding,NSCopying>

@property(nonatomic,readonly) int rating;        // record the rating num

@property(nonatomic,readonly) UIImage *photo;    // the photo of the meal

@property(nonatomic,readonly) NSString *name;    // the name of the meal

- (instancetype)initWithName:(NSString *)name rating:(int) rating photo:(UIImage *)photo;

@end
