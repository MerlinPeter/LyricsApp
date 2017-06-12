//
//  DownloadData.h
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyUtility.h"
@interface DownloadData : NSObject
{
    
}
@property (weak, nonatomic) id<MyUtility> delegate;

-(void)downloadData:(NSString*)url;
-(void)setDelegate:(id)deleg;
-(void)downloadLyrics:(NSString*)artist song:(NSString*)song;

@end
