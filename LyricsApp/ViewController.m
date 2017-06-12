//
//  ViewController.m
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import "ViewController.h"
#import "DownloadData.h"
#import "SearchResultsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)searchSelected:(id)sender
{
    if([_searchField.text length] > 0)
    {
        DownloadData *downloadData = [[DownloadData alloc] init];
        [downloadData setDelegate:self];
        [downloadData downloadData:_searchField.text];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]  initWithTitle:@"Error" message:@"Kindly enter data in search field" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}


-(void)dataDownloaded:(NSMutableArray*)dataDict
{
    NSLog(@"Data is %@",dataDict);
    
     ViewController __weak *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        SearchResultsViewController *searchCntrl = [[SearchResultsViewController alloc] initWithNibName:@"SearchResultsViewController" bundle:nil];
        searchCntrl.dataArray = dataDict;
        [weakSelf.navigationController pushViewController:searchCntrl animated:YES];
    });
}

@end
