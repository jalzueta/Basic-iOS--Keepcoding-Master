//
//  FLGCharacterViewController.m
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import "FLGCharacterViewController.h"


@implementation FLGCharacterViewController

- (id) initWithModel: (FLGStarWarsCharacter *) model{
    // NibName: lo mismo que un XIB, pero con formato distinto (compilado en formato binario) --> ponemos "nil" para que aplique cierto comportamiento por defecto
    // Bundle: carpeta que se hace pasar por un fichero (como en el finder). Representa la ubicacion del "nib"
    // poniendo "nil"/"nil" le digo que busque un nib con el nombre del controlador en la carpeta principal
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    return self;
}



// método de delegado --> el controlador es delegado de la vista.
// la vista se ha cargado pero no se han posicionado todavia (tamaño y geometría no son correctos)
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//}

 // la vista está apunto de aparecer, esta cargada, con el tamaño correctos... despues del viewDidLoad
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Sincronizar model -> vista
    self.photoView.image = self.model.photo;
    
}

// el dispositivo avisa a las Apps de que se está quedando sin memoria y cada App llama a estos métodos de todos los controladores. Es momento de "soltar lastre" para que el S.O. no nos mate a nosotros sino al resto de Apps
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
