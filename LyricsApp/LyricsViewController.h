//
//  LyricsViewController.h
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LyricsViewController : UIViewController
{
    NSString *lyricsLbl;
    IBOutlet  UITextView *lyricsTxtView;
}

@property (nonatomic, strong) NSString *lyricsLbl;
@property (nonatomic, strong) IBOutlet  UITextView *lyricsTxtView;
@end
