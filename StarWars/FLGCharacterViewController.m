//
//  FLGCharacterViewController.m
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import "FLGCharacterViewController.h"
#import "FLGWikiViewController.h"
#import "CafPlayer.h"
#import "FLGStarWarsCharacter.h"

@implementation FLGCharacterViewController

#pragma mark - Init

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
    
    // Asegurarse de que no se ocupa toda la pantalla cuando se esta en un combinador
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Sincronizar model -> vista
    // Sincronizo modelo -> vista(s)
    [self syncViewWithModel];
    
    // Detectar la situacion de orientacion inicial y adaptar el boton del SplitViewController
    if (self.splitViewController.displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    }else {
        self.navigationItem.leftBarButtonItem = nil;
    }
}


#pragma mark - Memory

// el dispositivo avisa a las Apps de que se está quedando sin memoria y cada App llama a estos métodos de todos los controladores. Es momento de "soltar lastre" para que el S.O. no nos mate a nosotros sino al resto de Apps
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions

// IBAction, Interface Builder
- (IBAction)playSound:(id)sender{
    
    // Sacamos el sonido del modelo y lo reproducimos
    self.player = [CafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
}

- (IBAction)displayWiki:(id)sender{
    
    // Crear un wikiVC
    FLGWikiViewController *wikiVC = [[FLGWikiViewController alloc] initWithModel:self.model];
    
    // Hacer un push usando la propiedad "navigationController" que tiene todo UIViewController
    [self.navigationController pushViewController:wikiVC animated:YES];
}


#pragma mark - UISplitViewControllerDelegate

- (void) splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    //TODO: mirar en la documentación todos los modos
    
    // Averiguar si la tabla se ve o no
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        // La tabla esta oculta y cuelga del boton
        // Ponemos ese boton en mi barra de navegación --> se podría poner en cualquier otro sitio que nos apetezca
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }else {
        // Se muestra la tabla
        // Oculto el boton de la barra de navegacion
        self.navigationItem.leftBarButtonItem = nil;
    }
}

#pragma mark - FLGUniverseTableViewControllerDelegate

- (void) universeTableViewController:(FLGUniverseTableViewController *)universeTableViewController
                  didSelectCharacter:(FLGStarWarsCharacter *)character{
    
    
    // Actualizo el modelo
    self.model = character;
    
    // Sincronizo modelo -> vista(s)
    [self syncViewWithModel];
}

- (void) syncViewWithModel{
    self.title = self.model.alias;
    self.photoView.image = self.model.photo;
}


@end
