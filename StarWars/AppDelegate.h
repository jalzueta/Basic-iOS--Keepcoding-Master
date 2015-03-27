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

// MODIFICADORES de PROPIEDADES
// ----------------------------------------------------------------
// strong: tiene que ver con la gestión de memoria --> ARC no destruye los objetos que tengan conexiones "strong" de entrada en ellas, ver pdf
// weak: los IBOutles y los delegados --> Se hacen weak para evitar los ciclos aislados "strong", ver pdf
// copy: proteger contra el bug de "alias". Dos propiedades apuntan al mismo NSString y al ser cambiada por uno de ellos, le cambia también al otro y no se ha enterado. Al poner copy, en vez de quedarse la propiedad con la referencia al objeto, hace una copia del mismo, de manera que nadie más tiene una referencia a esa objeto. Se usa "copy" para todos los objetos que tienen una subclase "mutable" o que sean "mutable" per-sé(generalmente solo se usa para NSString).
// copy hace una copia "strong" directa
// ----------------------------------------------------------------
// nonatomic: insegura en un entorno multitarea.Son un pelín más rápida, por eso se utiliza por defecto en los códigos de ejemplo de Apple
// atomic: seguros en un entorno multitarea. Solo puede acceder una sola hebra

// -------------------------------
// No objetos: (nonatomic)
// NSString (todos los mutables): (copy, nonatomic)
// Objetos: (strong, nonatomic)
// IBOutlets, delegates: (weak, nonatomic)
// -------------------------------

@end

