//
//  FLGStarWarsUniverse.h
//  StarWars
//
//  Created by Javi Alzueta on 26/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLGStarWarsCharacter.h"

// swapi.co -> servicios REST sobre Star Wars
@interface FLGStarWarsUniverse : NSObject

// NSUInteger: es un typedef. Es preferible usar los typedef de Cocoa -> para evitar problemas con los S.O. de 32 y 64 bits
// readonly: el compilador no me crea un setter
@property (nonatomic, readonly) NSUInteger rebelCount;
@property (nonatomic, readonly) NSUInteger imperialCount;

// metodos accesores para los elementos del modelo
- (FLGStarWarsCharacter *) rebelAtIndex: (NSUInteger) index;
- (FLGStarWarsCharacter *) imperialAtIndex: (NSUInteger) index;

@end
