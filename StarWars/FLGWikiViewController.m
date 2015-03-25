//
//  FLGWikiViewController.m
//  StarWars
//
//  Created by Javi Alzueta on 25/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import "FLGWikiViewController.h"


@implementation FLGWikiViewController

- (id) initWithModel: (FLGStarWarsCharacter *) model{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    return self;
}


- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Sincronizar modelo -> vista
    // NSURLRequest: es un NSURL pero con una poitica de cache y un timeout
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiURL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
