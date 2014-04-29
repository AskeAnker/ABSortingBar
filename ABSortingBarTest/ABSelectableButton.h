//
//  KTSelectableButton.h
//  KalorieTal
//
//  Created by Aske Bendtsen on 24/02/14.
//  Copyright (c) 2014 Appbuilders. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ABSelectableButtonDelegate;

typedef enum {
    KTSegmentedSortStateNone,
    KTSegmentedSortStateDescending,
    KTSegmentedSortStateAscending
} KTSegmentedSortState;

@interface ABSelectableButton : UIButton{

    KTSegmentedSortState _segmentedSortState;
    

}
@property (nonatomic, retain) UIColor *selectedColor;
@property (nonatomic, retain) UIColor *deselectedColor;
@property (nonatomic, retain) UIColor *selectedTitleColor;
@property (nonatomic, retain) UIColor *deselectedTitleColor;

@property (nonatomic, weak) id <ABSelectableButtonDelegate> delegate;
@property(nonatomic, assign) KTSegmentedSortState segmentedSortState;


-(void)setSegmentedSortState:(KTSegmentedSortState)segmentedSortState;

@end


@protocol ABSelectableButtonDelegate <NSObject>
- (void)didSelectSegment:(ABSelectableButton *)segment;
@end