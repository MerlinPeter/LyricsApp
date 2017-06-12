//
//  DownloadData.m
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import "DownloadData.h"
#define MYURL "https://itunes.apple.com/search?term="
#define LYRICSURL "http://lyrics.wikia.com/api.php?func=getSong&artist="

// artist=Tom+Waits&song=I%20Hope%20That%20I%20Don't%20Fall%20In%20Love%20With%20You&fmt=json
@implementation DownloadData

-(void)setDelegate:(id)deleg
{
    _delegate = deleg;
}

-(void)downloadData:(NSString*)text
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlStr = @MYURL;
    urlStr = [urlStr stringByAppendingString:text];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[session dataTaskWithURL:[NSURL URLWithString:urlStr]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSError *jsonError = nil;
                NSMutableDictionary* dataDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                if (jsonError) {
                    NSLog(@"error is %@", [jsonError localizedDescription]);
                    // Handle Error and return
                    return;
                }
                else{
                    [_delegate dataDownloaded:[dataDict valueForKey:@"results"]];
                }
                
                
            }] resume];
}

-(void)downloadLyrics:(NSString*)artist song:(NSString*)song
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlStr = @LYRICSURL;
    urlStr = [[[[urlStr stringByAppendingString:artist] stringByAppendingString:@"&song="] stringByAppendingString:song] stringByAppendingString:@"&fmt=json"];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[session dataTaskWithURL:[NSURL URLWithString:urlStr]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSError *jsonError = nil;
                NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                if (jsonError) {
                    NSLog(@"error is %@", [jsonError localizedDescription]);
                    // Handle Error and return
                    return;
                }
                else{
                    NSRange  urlRange =         [str rangeOfString:@"url"];
                    NSRange  lyrRange =         [str rangeOfString:@"lyrics"];
                   NSString *lyrics = [str substringWithRange:NSMakeRange(lyrRange.location+lyrRange.length+2, urlRange.location-urlRange.length-lyrRange.location-lyrRange.length-2)];
                    [_delegate lyricsDownloaded:lyrics ];
                }
                
                
            }] resume];
}
@end
