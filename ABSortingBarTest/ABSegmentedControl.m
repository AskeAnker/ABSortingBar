//
//  ABSegmentedControl.m
//  KalorieTal
//
//  Created by Aske Bendtsen on 25/02/14.
//  Copyright (c) 2014 Appbuilders. All rights reserved.
//

#import "ABSegmentedControl.h"

@implementation ABSegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

-(void)initialize{

    
    self.segments = [[NSMutableArray alloc]init];
    
    self.sortIconDesc = [[UILabel alloc]init];
    self.sortIconAsc = [[UILabel alloc]init];
    
}

-(ABSelectableButton*)segmentAtIndex:(NSUInteger)index{

    return [self.segments objectAtIndex:index];
   
}


-(void)numberOfSegments:(int)n{

    self.numberOfSegments = n;

    for (int i=0; i<n; i++) {
        ABSelectableButton *btn = [[ABSelectableButton alloc]initWithFrame:CGRectMake((self.frame.size.width/n)*i, 0, self.frame.size.width/n, self.frame.size.height)];
        btn.delegate = self;
        [btn setSegmentedSortState:KTSegmentedSortStateNone];
        [self.segments addObject:btn];

    }
    

}

-(void)selectSegmentAtIndex:(int)index{

    [self didSelectSegment:[self segmentAtIndex:index]];
    
}

-(void)didSelectSegment:(ABSelectableButton *)segment{

    
    
    for (ABSelectableButton *btn in self.segments) {
        if (btn == segment) {
            switch (segment.segmentedSortState) {
                case KTSegmentedSortStateNone:
                    [segment setSegmentedSortState:KTSegmentedSortStateAscending];
                    [self addAscSortIconToSegment:segment];
                    break;
                case KTSegmentedSortStateDescending:
                    [segment setSegmentedSortState:KTSegmentedSortStateAscending];
                    [self addAscSortIconToSegment:segment];
                    break;
                case KTSegmentedSortStateAscending:
                    [segment setSegmentedSortState:KTSegmentedSortStateDescending];
                    [self addDescSortIconToSegment:segment];
                    break;
                    
                default:
                    break;
            }
            
            if ([self.delegate respondsToSelector:@selector(didSelectSegmentAtIndex:)]) {
                [self.delegate didSelectSegmentAtIndex:(int)[self.segments indexOfObject:segment]];
            }
        }
        else
            [btn setSegmentedSortState:KTSegmentedSortStateNone];
    }
    
    
}

-(void)addDescSortIconToSegment:(ABSelectableButton*)segment{

    if (![self.sortIconAsc isHidden]) {
        self.sortIconAsc.hidden = YES;
    }
    

    if ([self.sortIconDesc isHidden])
        self.sortIconDesc.hidden = NO;
    
    self.sortIconDesc.frame = CGRectMake(segment.frame.origin.x, (segment.frame.size.height/2), segment.frame.size.width, segment.frame.size.height/2);
    self.sortIconAsc.frame = self.sortIconDesc.frame;
    
}

-(void)addAscSortIconToSegment:(ABSelectableButton*)segment{
    
    if (![self.sortIconDesc isHidden]) {
        self.sortIconDesc.hidden = YES;
    }
    
    
    if ([self.sortIconAsc isHidden])
        self.sortIconAsc.hidden = NO;
    
    self.sortIconAsc.frame = CGRectMake(segment.frame.origin.x, (segment.frame.size.height/2), segment.frame.size.width, segment.frame.size.height/2);
    self.sortIconDesc.frame = self.sortIconAsc.frame;
    
}

-(void)layoutSubviews{
    
    for (ABSelectableButton *btn in self.segments) {
        [self addSubview:btn];
    }
    
    [self addSubview:self.sortIconDesc];
    //self.sortIconDesc.hidden = YES;
    
    [self addSubview:self.sortIconAsc];
    //self.sortIconAsc.hidden = YES;
    
    
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
