//
//  FLGWikiViewController.h
//  StarWars
//
//  Created by Javi Alzueta on 25/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLGStarWarsCharacter.h"

@interface FLGWikiViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *browser;

@property (strong, nonatomic) FLGStarWarsCharacter *model;

- (id) initWithModel: (FLGStarWarsCharacter *) model;

@end
