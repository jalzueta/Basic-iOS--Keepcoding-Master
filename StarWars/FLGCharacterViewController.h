//
//  FLGCharacterViewController.h
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

@import UIKit;

#import "FLGStarWarsCharacter.h"
#import "CafPlayer.h"

// UISplitViewControllerDelegate: le dice al mundo que está capacitado para ser el delegado de un SplitViewController
@interface FLGCharacterViewController : UIViewController<UISplitViewControllerDelegate>

// No creamos nunca una variable global, para eso usaremos siempre las propiedades
@property (strong, nonatomic) CafPlayer *player;
@property (strong, nonatomic) FLGStarWarsCharacter *model;

// IBOutlet se usa para que Interface Builder sepa que esta property corresponde a un elemento de la vista
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (id) initWithModel: (FLGStarWarsCharacter *) model;

- (IBAction)playSound:(id)sender;
- (IBAction)displayWiki:(id)sender;

@end
