//
//  FLGCharacterViewController.h
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

@import UIKit;

#import "FLGStarWarsCharacter.h"


@interface FLGCharacterViewController : UIViewController

@property (strong, nonatomic) FLGStarWarsCharacter *model;

// IBOutlet se usa para que Interface Builder sepa que esta property corresponde a un elemento de la vista
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (id) initWithModel: (FLGStarWarsCharacter *) model;

@end
