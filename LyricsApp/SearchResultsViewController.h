//
//  SearchResultsViewController.h
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUtility.h"

@interface SearchResultsViewController : UIViewController<UITableViewDelegate,MyUtility, UITableViewDataSource >
{
    IBOutlet UITableView *tblView;
    NSMutableArray *dataArray;
}

@property (nonatomic, strong) IBOutlet UITableView *tblView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
