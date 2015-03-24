//
//  AppDelegate.h
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import <UIKit/UIKit.h>

// UIResponder: es un señor que permite responder a eventos
// UIApplicationDelegate: significa que la clase AppDelegate entiende todos los mensajes que le pueda enviar UIApplication, es decir, puede ser su delegado
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//UIWindow: es una UIView que ocupa toda la pantalla

// strong: tiene que ver con la gestión de memoria --> lo veremos
// weak: los IBOutles, por ejemplo
// nonatomic: insegura en un entorno multitarea.Son un pelín más rápida, por eso se utiliza por defecto en los códigos de ejemplo de Apple
// atomic: seguros en un entorno multitarea. Solo puede acceder una sola hebra

// -------------------------------
// Objetos: (strong, nonatomic)
// No objetos: (nonatomic)
// -------------------------------

@end

