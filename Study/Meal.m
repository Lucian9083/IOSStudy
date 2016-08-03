//
//  Meal.m
//  Study
//
//  Created by LvZheng on 16/8/3.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import "Meal.h"

@implementation Meal

- (instancetype)initWithName:(NSString *)name rating:(int) rating photo:(UIImage *)photo{
    
    self = [self init];
    
    if(!name || [name isEqualToString:@""] || rating < 0){
        return nil;
    }
    
    self.name = name;
    self.rating = rating;
    self.photo = photo;
    
    return self;
}

@end
