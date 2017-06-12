//
//  MyUtility.h
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyUtility <NSObject>

-(void)dataDownloaded:(NSMutableArray*)data;
-(void)lyricsDownloaded:(NSString*)lyrics;
@end
