//
//  ABSegmentedControl.h
//  KalorieTal
//
//  Created by Aske Bendtsen on 25/02/14.
//  Copyright (c) 2014 Appbuilders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABSelectableButton.h"

@protocol ABSegmentedControlDelegate;


@interface ABSegmentedControl : UIView <ABSelectableButtonDelegate>

@property (nonatomic, retain) NSMutableArray *segments;
@property (nonatomic, assign) int numberOfSegments;
@property (nonatomic, weak) id <ABSegmentedControlDelegate> delegate;
@property(nonatomic, retain) UILabel *sortIconDesc;
@property(nonatomic, retain) UILabel *sortIconAsc;

-(void)numberOfSegments:(int)n;
-(ABSelectableButton*)segmentAtIndex:(NSUInteger)index;
-(void)selectSegmentAtIndex:(int)index;

@end


@protocol ABSegmentedControlDelegate <NSObject>
- (void)didSelectSegmentAtIndex:(int)index;
@end