//
//  FLGWikiViewController.m
//  StarWars
//
//  Created by Javi Alzueta on 25/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import "FLGWikiViewController.h"
#import "FLGUniverseTableViewController.h"
#import "FLGStarWarsCharacter.h"


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
    
    // Asegurarse de que no se ocupa toda la pantalla cuando se esta en un combinador
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Nos damos de alta en las notificaciones
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(notifyThatCharacterDidChange:)
                   name:CHARACTER_DID_CHANGE_NOTIFICATION_NAME
                 object:nil]; // Quien es el sender de la notificacion: en este caso no da igual
    
    [self syncViewToModel];
}

- (void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    // Asignar delegados
    self.browser.delegate = self;
}

- (void) viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    // Nos damos de baja de las notificaciones
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    // Paro y oculto el activityView
    [self.activityView setHidden:YES];
    [self.activityView stopAnimating];
    
    NSLog(@"Error en la carga: %@", error);
}

- (void) webViewDidFinishLoad:(UIWebView *)webView{
    
    // Paro y oculto el activityView
    [self.activityView setHidden:YES];
    [self.activityView stopAnimating];
    
    self.canLoad = NO;
}

// Vamos a controlar con este metodo la navegación dentro del webView
- (BOOL) webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
  navigationType:(UIWebViewNavigationType)navigationType{
    
    // Así no funciona, porque se hacen ciertas reconversiones de la URL que no controlamos
//    if ([request.URL isEqual:self.model.wikiURL]) {
//        return YES;
//    }
//    else{
//        return NO;
//    }
    
    // Ponemos "UIWebViewNavigationTypeFormSubmitted" porque en la pagina de wikipedia hay un pequeño formulario en la parte de arriba
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) || (navigationType == UIWebViewNavigationTypeFormSubmitted)) {
        return NO;
    }
    else{
        return self.canLoad;
    }
}


#pragma mark - Notifications
// CHARACTER_DID_CHANGE_NOTIFICATION_NAME
- (void) notifyThatCharacterDidChange: (NSNotification *) aNotification{
    
    // Sacamos el personaje
    // no usar "valueForKey", ya que eso es para KVC. Para diccionarios se usa "objectForKey"
    FLGStarWarsCharacter *character = [aNotification.userInfo objectForKey:CHARACTER_KEY];
    
    // Actualizamos el modelo
    self.model = character;
    
    // Sincronizamos modelo -> vista
    [self syncViewToModel];
}


#pragma mark - Utils

- (void) syncViewToModel{
    // Sincronizar modelo -> vista
    self.title = @"Wiki";
    
    self.canLoad = YES;
    
    [self.activityView setHidden:NO];
    [self.activityView startAnimating];
    
    // NSURLRequest: es un NSURL pero con una poitica de cache y un timeout
    self.browser.delegate = self;
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiURL]];
}



@end
