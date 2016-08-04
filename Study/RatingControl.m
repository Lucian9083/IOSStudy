//
//  RatingControl.m
//  Study
//
//  Created by LvZheng on 16/8/1.
//  Copyright © 2016年 LvZheng. All rights reserved.
//

#import "RatingControl.h"

@interface RatingControl()

@property NSMutableArray *ratingButtons;

@end

@implementation RatingControl

const int RATING_COUNT = 5;

const float OFFSET = 5.0f;

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    _ratingButtons = [NSMutableArray new];
    
    UIImage *emptyStar = [UIImage imageNamed:@"emptyStar"];
    
    UIImage *filledStar = [UIImage imageNamed:@"filledStar"];
    
    for(int i = 0 ; i < RATING_COUNT; i++){
        
        UIButton *ratingButton = [UIButton new];
        
        [ratingButton setImage:emptyStar forState:UIControlStateNormal];
        [ratingButton setImage:filledStar forState:UIControlStateSelected];
        [ratingButton setImage:filledStar forState:UIControlStateHighlighted];
        
//        ratingButton.backgroundColor = [UIColor blueColor];
        ratingButton.adjustsImageWhenHighlighted = false;
        
        [ratingButton addTarget:self action: @selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        [_ratingButtons addObject:ratingButton];
        
        [self addSubview:ratingButton];
    }
    
    
    return self;
    
}

- (void)layoutSubviews{
    
    const float ButtonSize = [self frame].size.height;
    
    CGRect frame = CGRectMake(0, 0, ButtonSize, ButtonSize);
    
    for(UIButton *button in _ratingButtons){
        
        NSUInteger index = [_ratingButtons indexOfObject:button];
        
        CGFloat f = index * (ButtonSize + OFFSET);
        
        frame.origin.x = f;
        
        button.frame = frame;
    }
    
    [self updateRatingState];
    
}

- (CGSize)intrinsicContentSize{
    
    const float height = [self frame].size.height;
    
    const float width = (RATING_COUNT * height) + (RATING_COUNT - 1) * OFFSET;
    
    return CGSizeMake(width, height);
}
// invoke when rating button cliked
- (void)ratingButtonTapped:(UIButton *) button{
    
//    NSLog(@"I am a button %@",button);
    
    _rating = (int)[_ratingButtons indexOfObject:button] + 1;
    
    [self updateRatingState];
    
}
/**
 Update the rating count
 */
- (void)updateRatingState{
    
    for(UIButton *button in _ratingButtons){
        
        button.selected = [_ratingButtons indexOfObject:button] < _rating;
    }
    
}

- (void)setRating:(int)rating{
    _rating = rating;
    
    [self setNeedsLayout];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
