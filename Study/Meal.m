//
//  Meal.m
//  Study
//
//  Created by LvZheng on 16/8/3.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import "Meal.h"

@interface Meal()

@property(nonatomic) NSString *name;

@property(nonatomic) int rating;

@property(nonatomic) UIImage *photo;

@end

@implementation Meal


#pragma mark - init

- (instancetype)initWithName:(NSString *)name rating:(int) rating photo:(UIImage *)photo{
    
    if(!name || [name isEqualToString:@""] || rating < 0){
        
        return nil;
        
    }else if(self = [self init]){
        
        self.name = name;
        self.rating = rating;
        self.photo = photo;
        
    }
    
    return self;
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    
    NSString *name = [aDecoder decodeObjectForKey:@"name"];
    
    int rating = [aDecoder decodeIntForKey:@"rating"];
    
    UIImage *photo = [aDecoder decodeObjectOfClass:[UIImage class] forKey:@"photo"];
    
    
    return [self initWithName:name rating:rating photo:photo];
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"name"];
    
    [aCoder encodeInt:self.rating forKey:@"rating"];
    
    [aCoder encodeObject:self.photo forKey:@"photo"];
    
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone{
    
    Meal *meal = [[Meal allocWithZone:zone] init];
    
    meal.name = [_name copyWithZone:zone];
    
    meal.rating = _rating;
    
    meal.photo = [_photo copy];
    
    return meal;
}

@end
