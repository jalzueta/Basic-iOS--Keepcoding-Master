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
#define CHARACTER_KEY @"character"
#define NEW_CHARACTER_NOTIFICATION_KEY @"currentCharacterHasChanged"

// Con esta sentencia le adelantamos al compilador que esta clase está definida en otro sitio
@class FLGUniverseTableViewController;

// <NSObject>: eso significa que todo objeto que implemente el protocolo FLGUniverseTableViewControllerDelegate debe entender también el protocolo NSObject
@protocol FLGUniverseTableViewControllerDelegate <NSObject>

@optional
// Siempre se envía como primer parámetro el remitente
- (void) universeTableViewController: (FLGUniverseTableViewController *) universeTableViewController didSelectCharacter: (FLGStarWarsCharacter *) character;

@end


@interface FLGUniverseTableViewController : UITableViewController

@property (strong, nonatomic) FLGStarWarsUniverse *model;
// id <FLGUniverseTableViewControllerDelegate>: cualquier tipo, pero que implemente el protocolo FLGUniverseTableViewControllerDelegate
@property (weak, nonatomic) id <FLGUniverseTableViewControllerDelegate> delegate;

// El inicializador designado debe recibir un estilo y un modelo
- (id) initWithModel: (FLGStarWarsUniverse *) model
               style: (UITableViewStyle) style;

@end
