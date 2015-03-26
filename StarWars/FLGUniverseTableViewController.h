//
//  FLGUniverseTableViewController.h
//  StarWars
//
//  Created by Javi Alzueta on 26/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLGStarWarsUniverse.h"

#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1

@interface FLGUniverseTableViewController : UITableViewController

@property (strong, nonatomic) FLGStarWarsUniverse *model;

// El inicializador designado debe recibir un estilo y un modelo
- (id) initWithModel: (FLGStarWarsUniverse *) model
               style: (UITableViewStyle) style;

@end
