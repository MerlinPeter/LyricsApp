//
//  ViewController.h
//  LyricsApp
//
//  Created by Merlin Ahila on 6/9/17.
//  Copyright © 2017 Merlin Ahila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUtility.h"

@interface ViewController : UIViewController<MyUtility, UITextFieldDelegate>
{
    IBOutlet UITextField *searchField;
    
}

@property (strong, nonatomic) IBOutlet UITextField *searchField;
@end

