//
//  DetailViewController.h
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Restaurante.h"

@interface DetailViewController : UIViewController <MKMapViewDelegate>

@property Restaurante *restauranteSeleccionado;

@end
