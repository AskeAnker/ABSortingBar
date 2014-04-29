//
//  KTSelectableButton.m
//  KalorieTal
//
//  Created by Aske Bendtsen on 24/02/14.
//  Copyright (c) 2014 Appbuilders. All rights reserved.
//

#import "ABSelectableButton.h"

@implementation ABSelectableButton

@synthesize segmentedSortState = _segmentedSortState;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)initialize{

    [self addTarget:self action:@selector(didTabSegment:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)didTabSegment:(ABSelectableButton*)segment{
    
    if ([self.delegate respondsToSelector:@selector(didSelectSegment:)]) {
        [self.delegate didSelectSegment:self];
    }
    
}


-(void)setSegmentedSortState:(KTSegmentedSortState)segmentedSortState{

    _segmentedSortState = segmentedSortState;
    [self setAppearenceForState:_segmentedSortState];
    
}

-(void)setAppearenceForState:(KTSegmentedSortState)state{

    switch (state) {
        case KTSegmentedSortStateNone:
            [self setSegmentNormal];
            break;
        case KTSegmentedSortStateDescending:
            [self setSegmentSelected];
            break;
        case KTSegmentedSortStateAscending:
            [self setSegmentSelected];
            break;
            
        default:
            break;
    }
    
}

-(void)setSegmentSelected{
    //The animation is of course optional
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 15, 0);
        self.backgroundColor = self.selectedColor;
        [self setTitleColor:self.selectedTitleColor forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)setSegmentNormal{
    //The animation is of course optional
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.backgroundColor = self.deselectedColor;
        [self setTitleColor:self.deselectedTitleColor forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
