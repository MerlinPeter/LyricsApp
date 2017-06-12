//
//  UIImage+DownloadImage.h
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DownloadImage)

+ (void) loadFromURL: (NSURL*) url callback:(void (^)(UIImage *image))callback;

@end
