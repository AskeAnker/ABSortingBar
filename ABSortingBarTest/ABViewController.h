//
//  ABViewController.h
//  ABSortingBarTest
//
//  Created by Aske Bendtsen on 29/04/14.
//  Copyright (c) 2014 Aske Bendtsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABSegmentedControl.h"

@interface ABViewController : UIViewController<ABSegmentedControlDelegate, UITableViewDataSource, UITableViewDelegate>{

    UITableView *mainTableView;
    NSMutableArray *tableData;
    ABSegmentedControl *sortingBar;
}

@end
