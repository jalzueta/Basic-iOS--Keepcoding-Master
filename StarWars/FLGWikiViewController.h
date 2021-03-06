//
//  FLGWikiViewController.h
//  StarWars
//
//  Created by Javi Alzueta on 25/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FLGStarWarsCharacter;

// UIWebViewDelegate: le decimos al mundo que este controlador puedes ser un delegado del WebView
@interface FLGWikiViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (nonatomic) BOOL canLoad;

@property (strong, nonatomic) FLGStarWarsCharacter *model;

- (id) initWithModel: (FLGStarWarsCharacter *) model;

@end
