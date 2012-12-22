//
//  ViewController.m
//  NSBackbone
//
//  Created by Tal Bereznitskey on 22/12/12.
//  Copyright (c) 2012 Tal Bereznitskey. All rights reserved.
//

#import "BackboneViewController.h"
#import "NSObject+KVOBlockBinding.h"
#import "Song.h"

@implementation BackboneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Creating the initial model
    [self createSong];
    
    // Observing changes to the model
    [self observeModel];
    
    // Rendering the UI for the first time
    [self render];
    
    // Start generating new names for the song every two seconds to test observation
    [self generateNewSongNameEveryTwoSeconds];
}

- (void)createSong
{
    model = [[Song alloc] init];
    model.name = @"Yesterday";
    model.favorite = @NO;
}

#pragma mark - Observing

- (void)observeModel
{
    __weak id weakSelf = self;
    [model addObserverForKeyPath:@"name" owner:self block:^(id observed, NSDictionary *change) {
        [weakSelf renderName];
    }];
    [model addObserverForKeyPath:@"favorite" owner:self block:^(id observed, NSDictionary *change) {
        [weakSelf renderFavorite];
    }];
}

#pragma mark - Generating new song names

- (void)generateNewSongNameEveryTwoSeconds
{
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(generateNewSongName) userInfo:nil repeats:YES];
}

- (void)generateNewSongName
{
    static NSInteger index = 0;
    NSArray *songNames = @[@"I Want to Hold Your Hand", @"Norwegian Wood", @"Hey Jude", @"Strawberry Fields Forever", @"Yesterday"];
    model.name = [songNames objectAtIndex:(index++ % [songNames count])];
}

#pragma mark - User Actions

- (IBAction)toggleFavorite:(id)sender
{
    BOOL toggledValue = (![model.favorite boolValue]);
    model.favorite = [NSNumber numberWithBool:toggledValue];
}

#pragma mark - Rendering UI

- (void)renderName
{
    songLabel.text = model.name;
}

- (void)renderFavorite
{
    favoriteLabel.text = ([model.favorite boolValue] ? @"★" : @"☆");
}

- (void)render
{
    [self renderName];
    [self renderFavorite];
}

@end
