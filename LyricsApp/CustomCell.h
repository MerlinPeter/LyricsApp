//
//  CustomCell.h
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UIImageView *myImg;
    IBOutlet UILabel *trackName;
    IBOutlet UILabel *artistName;
    IBOutlet UILabel *albumName;
}

@property (nonatomic, weak) IBOutlet UIImageView *myImg;
@property (nonatomic, weak) IBOutlet UILabel *trackName;
@property (nonatomic, weak) IBOutlet UILabel *artistName;
@property (nonatomic, weak) IBOutlet UILabel *albumName;

@end
