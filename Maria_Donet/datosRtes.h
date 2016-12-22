//
//  datosRtes.h
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restaurante.h"
#import "DaoRte.h"

@interface datosRtes : NSObject


-(void)guardarBBDD;

-(BOOL) estableciendoPrimeraConexion;

@end
