//
//  Restaurante.h
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurante : NSObject

@property int codigo;
@property NSString *nombre;
@property NSString *descripcion;
@property double longitud;
@property double latitud;

-(id) initConNombre: (NSString*)nombre
     ConDescripcion: (NSString*)descripcion
         ConLatitud: (double)latitud
        ConLongitud: (double)longitud;

-(id) initConCodigo: (int)codigo
          ConNombre: (NSString*)nombre
     ConDescripcion: (NSString*)descripcion
         ConLatitud: (double)latitud
        ConLongitud: (double)longitud;

@end
