//
//  ViewController.h
//  NSBackbone
//
//  Created by Tal Bereznitskey on 22/12/12.
//  Copyright (c) 2012 Tal Bereznitskey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Song;

@interface BackboneViewController : UIViewController
{
    IBOutlet UILabel *songLabel;
    IBOutlet UILabel *favoriteLabel;
    
    Song *model;
}

- (IBAction)toggleFavorite:(id)sender;

@end
