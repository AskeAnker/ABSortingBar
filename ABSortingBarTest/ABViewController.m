//
//  ABViewController.m
//  ABSortingBarTest
//
//  Created by Aske Bendtsen on 29/04/14.
//  Copyright (c) 2014 Aske Bendtsen. All rights reserved.
//

#import "ABViewController.h"

@interface ABViewController ()

@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    tableData = [[NSMutableArray alloc]init];
    
    for (int i=0; i<1000; i++) {
        int random = arc4random_uniform(i);
        NSDictionary *data = @{@"key1": [NSString stringWithFormat:@"name%i", i], @"key2":[NSNumber numberWithFloat:i/100.0*random], @"key3": [NSNumber numberWithInt:abs(i-random)], @"key4":[NSNumber numberWithFloat:i/10.0*random], @"key5":[NSString stringWithFormat:@"textValue%i", abs(i-1000) ]};
        [tableData addObject:data];
    }
    
    
    sortingBar = [[ABSegmentedControl alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];
    sortingBar.backgroundColor = [UIColor greenColor];
    [sortingBar numberOfSegments:5];
    sortingBar.delegate = self;
    
    sortingBar.sortIconDesc.backgroundColor = [UIColor grayColor];
    sortingBar.sortIconDesc.font = [UIFont systemFontOfSize:15];
    sortingBar.sortIconDesc.text = [NSString stringWithFormat:@"DESC"];
    sortingBar.sortIconDesc.textColor = [UIColor whiteColor];
    sortingBar.sortIconDesc.textAlignment = NSTextAlignmentCenter;
    
    sortingBar.sortIconAsc.backgroundColor = [UIColor grayColor];
    sortingBar.sortIconAsc.font = [UIFont systemFontOfSize:15];
    sortingBar.sortIconAsc.text = [NSString stringWithFormat:@"ASC"];
    sortingBar.sortIconAsc.textColor = [UIColor whiteColor];
    sortingBar.sortIconAsc.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:sortingBar];
    
    
    //If all segments should have same layout, just loop through them

    for (int i=0; i<[sortingBar numberOfSegments]; i++) {
        [sortingBar segmentAtIndex:i].titleLabel.font = [UIFont systemFontOfSize:15];
        [[sortingBar segmentAtIndex:i] setTitle:[[NSString stringWithFormat:@"key%i", i+1]uppercaseString] forState:UIControlStateNormal];
        [sortingBar segmentAtIndex:i].titleLabel.textAlignment = NSTextAlignmentCenter;
        [[sortingBar segmentAtIndex:i] setDeselectedColor:[UIColor whiteColor]];
        [[sortingBar segmentAtIndex:i] setSelectedColor:[UIColor lightGrayColor]];
        [[sortingBar segmentAtIndex:i] setDeselectedTitleColor:[UIColor grayColor]];
        [[sortingBar segmentAtIndex:i] setSelectedTitleColor:[UIColor blackColor]];
        
    }
 
    
    //For single-segment customization
    
    //--------------------------------- SEGMENT1 --------------------------------- //
    
//    
//    [sortingBar segmentAtIndex:0].titleLabel.font = [UIFont systemFontOfSize:15];
//    [[sortingBar segmentAtIndex:0] setTitle:[[NSString stringWithFormat:@"key1"]uppercaseString] forState:UIControlStateNormal];
//    [sortingBar segmentAtIndex:0].titleLabel.textAlignment = NSTextAlignmentCenter;
//    
//    [[sortingBar segmentAtIndex:0] setDeselectedColor:[UIColor whiteColor]];
//    [[sortingBar segmentAtIndex:0] setSelectedColor:[UIColor lightGrayColor]];
//    [[sortingBar segmentAtIndex:0] setDeselectedTitleColor:[UIColor grayColor]];
//    [[sortingBar segmentAtIndex:0] setSelectedTitleColor:[UIColor blackColor]];
//    
//    
//    //--------------------------------- SEGMENT2 --------------------------------- //
//    
//    
//    [sortingBar segmentAtIndex:1].titleLabel.font = [UIFont systemFontOfSize:15];
//    [[sortingBar segmentAtIndex:1] setTitle:[[NSString stringWithFormat:@"key2"]uppercaseString] forState:UIControlStateNormal];
//    [sortingBar segmentAtIndex:1].titleLabel.textAlignment = NSTextAlignmentCenter;
//
//    [[sortingBar segmentAtIndex:1] setDeselectedColor:[UIColor whiteColor]];
//    [[sortingBar segmentAtIndex:1] setSelectedColor:[UIColor lightGrayColor]];
//    [[sortingBar segmentAtIndex:1] setDeselectedTitleColor:[UIColor grayColor]];
//    [[sortingBar segmentAtIndex:1] setSelectedTitleColor:[UIColor blackColor]];
//    
//    
//    //--------------------------------- SEGMENT3 --------------------------------- //
//    
//    [sortingBar segmentAtIndex:2].titleLabel.font = [UIFont systemFontOfSize:15];
//    [[sortingBar segmentAtIndex:2] setTitle:[[NSString stringWithFormat:@"key3"]uppercaseString] forState:UIControlStateNormal];
//    [sortingBar segmentAtIndex:2].titleLabel.textAlignment = NSTextAlignmentCenter;
//
//    [[sortingBar segmentAtIndex:2] setDeselectedColor:[UIColor whiteColor]];
//    [[sortingBar segmentAtIndex:2] setSelectedColor:[UIColor lightGrayColor]];
//    [[sortingBar segmentAtIndex:2] setDeselectedTitleColor:[UIColor grayColor]];
//    [[sortingBar segmentAtIndex:2] setSelectedTitleColor:[UIColor blackColor]];
//    
//    
//    //--------------------------------- SEGMENT4 --------------------------------- //
//    
//    
//    [sortingBar segmentAtIndex:3].titleLabel.font = [UIFont systemFontOfSize:15];
//    [[sortingBar segmentAtIndex:3] setTitle:[[NSString stringWithFormat:@"key4"]uppercaseString] forState:UIControlStateNormal];
//    [sortingBar segmentAtIndex:3].titleLabel.textAlignment = NSTextAlignmentCenter;
//
//    [[sortingBar segmentAtIndex:3] setDeselectedColor:[UIColor whiteColor]];
//    [[sortingBar segmentAtIndex:3] setSelectedColor:[UIColor lightGrayColor]];
//    [[sortingBar segmentAtIndex:3] setDeselectedTitleColor:[UIColor grayColor]];
//    [[sortingBar segmentAtIndex:3] setSelectedTitleColor:[UIColor blackColor]];
//    
//    
//    //--------------------------------- SEGMENT5 --------------------------------- //
//    
//    
//    [sortingBar segmentAtIndex:4].titleLabel.font = [UIFont systemFontOfSize:15];
//    [[sortingBar segmentAtIndex:4] setTitle:[[NSString stringWithFormat:@"key5"]uppercaseString] forState:UIControlStateNormal];
//    [sortingBar segmentAtIndex:4].titleLabel.textAlignment = NSTextAlignmentCenter;
//
//    [[sortingBar segmentAtIndex:4] setDeselectedColor:[UIColor whiteColor]];
//    [[sortingBar segmentAtIndex:4] setSelectedColor:[UIColor lightGrayColor]];
//    [[sortingBar segmentAtIndex:4] setDeselectedTitleColor:[UIColor grayColor]];
//    [[sortingBar segmentAtIndex:4] setSelectedTitleColor:[UIColor blackColor]];
    
    
    //Select initial segment
    [sortingBar selectSegmentAtIndex:0];
    
    
    mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, sortingBar.frame.size.height+sortingBar.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height-sortingBar.frame.size.height)];
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    [self.view addSubview:mainTableView];
}

#pragma mark - segmentedControl delegate

-(void)didSelectSegmentAtIndex:(int)index{
    
     NSLog(@"did select segment at index: %i", index);
    
    ABSelectableButton *segment = [sortingBar segmentAtIndex:index];
    
    switch (segment.segmentedSortState) {
        case KTSegmentedSortStateDescending:
            [self sortListWithIndex:index ascending:NO];
            break;
        case KTSegmentedSortStateAscending:
            [self sortListWithIndex:index ascending:YES];
            break;
            
        default:
            break;
    }
    
   
}

#pragma mark - table data sorting

-(void)sortListWithIndex:(int)index ascending:(BOOL)ascending{
    
    //YOUR OWN CUSTOM SORTING
    
    //I'm creating a name descriptor for secondary sorting. You should of course use whatever you like
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"key1" ascending:ascending selector:@selector(compare:)];
    
    
    switch (index) {
        case 0:{
            NSLog(@"sorting key1");
//            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"key1" ascending:ascending selector:@selector(compare:)];
            NSArray *sortDescriptors = [NSArray arrayWithObject:nameDescriptor];
            [tableData sortUsingDescriptors:sortDescriptors];
            
        }
            break;
        case 1:
        {
            NSLog(@"sorting key2");
            NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"key2" ascending:ascending comparator:^NSComparisonResult(id obj1, id obj2) {
                if ([obj1 floatValue] > [obj2 floatValue])
                {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                if ([obj1 floatValue] < [obj2 floatValue])
                {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                return (NSComparisonResult)NSOrderedSame;
            }];
            
            NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDesc, nameDescriptor, nil];
            [tableData sortUsingDescriptors:sortDescriptors];
            
            
        }
            break;
        case 2:
        {
            NSLog(@"sorting key3");
            NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"key3" ascending:ascending comparator:^NSComparisonResult(id obj1, id obj2) {
                if ([obj1 intValue] > [obj2 intValue])
                {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                if ([obj1 intValue] < [obj2 intValue])
                {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                return (NSComparisonResult)NSOrderedSame;
            }];

            NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDesc, nameDescriptor, nil];
            [tableData sortUsingDescriptors:sortDescriptors];
            
            
        }
            break;
        case 3:
        {
            NSLog(@"sorting key4");
            NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"key4" ascending:ascending comparator:^NSComparisonResult(id obj1, id obj2) {
                if ([obj1 floatValue] > [obj2 floatValue])
                {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                if ([obj1 floatValue] < [obj2 floatValue])
                {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                return (NSComparisonResult)NSOrderedSame;
            }];

            NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDesc, nameDescriptor, nil];
            [tableData sortUsingDescriptors:sortDescriptors];
            
        }
            break;
        case 4:
        {
            NSLog(@"sorting key5");
            NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"key5" ascending:ascending selector:@selector(compare:)];

            NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDesc, nameDescriptor, nil];
            [tableData sortUsingDescriptors:sortDescriptors];
            
        }
            break;
            
        default:
            break;
    }
    
    //reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation doesn't work well (performance wise) with larger data sets. But it's pretty smooth with smaller data sets. You can of course decide/test this for yourself.
    if ([tableData count]>4000)
        [mainTableView reloadData];
    else
        [mainTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    //Scroll to top of tableview after new sorting
    [mainTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    // Usually the number of items in your array (the one that holds your list)
    return [tableData count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Where we configure the cell in each row
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell... setting the text of our cell's label

    NSDictionary *item = [tableData objectAtIndex:indexPath.row];

    
    cell.textLabel.text = [[item objectForKey:@"key1"] uppercaseString];
    cell.textLabel.numberOfLines = 1;
    cell.textLabel.frame = CGRectMake(0, 0, 220, 80);
    
    
    return cell;
}





#pragma mark - Table view delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    // If you want to push another view upon tapping one of the cells on your table.

    NSDictionary *item = [tableData objectAtIndex:indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:[item objectForKey:@"key1"] message:[item objectForKey:@"key5"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
