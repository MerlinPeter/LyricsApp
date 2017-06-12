//
//  SearchResultsViewController.m
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import "SearchResultsViewController.h"
#import "UIImage+DownloadImage.h"
#import "CustomCell.h"
#import "LyricsViewController.h"
#import "DownloadData.h"

@interface SearchResultsViewController ()

@end

@implementation SearchResultsViewController
@synthesize tblView;
@synthesize dataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Search Results";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    [UIImage loadFromURL:[NSURL URLWithString:@""] callback:^(UIImage *image) {
    // Use image. This will happen on Main thread
//}];


    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CustomCell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.trackName.text = [[dataArray objectAtIndex:indexPath.row] valueForKey:@"trackName"];
    cell.artistName.text = [[dataArray objectAtIndex:indexPath.row] valueForKey:@"artistName"];
//    cell.albumName.text = [dataArray objectAtIndex:indexPath.row] valueForKey:@"";
    NSString *imgURL = [[dataArray objectAtIndex:indexPath.row] valueForKey:@"artworkUrl60"];
    [UIImage loadFromURL:[NSURL URLWithString:imgURL] callback:^(UIImage *image) {
        // Use image. This will happen on Main thread
        cell.myImg.image = image;
        }];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DownloadData *downloadData = [[DownloadData alloc] init];
    [downloadData setDelegate:self];
    NSString *artist = [[dataArray objectAtIndex:indexPath.row] valueForKey:@"artistName"];
    NSString *song = [[dataArray objectAtIndex:indexPath.row] valueForKey:@"trackName"];
    [downloadData downloadLyrics:artist song:song];

}

-(void)lyricsDownloaded:(NSString*)lyrics;
{
    NSLog(@"Data is %@",lyrics);
    SearchResultsViewController __weak *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        LyricsViewController *cntrl = [[LyricsViewController alloc] initWithNibName:@"LyricsViewController" bundle:nil];
        cntrl.lyricsLbl = lyrics;
        [weakSelf.navigationController pushViewController:cntrl animated:YES];

    });
    
    
}


@end
