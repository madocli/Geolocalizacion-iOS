//
//  Restaurante.m
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import "Restaurante.h"

@implementation Restaurante

-(id)initConNombre:(NSString *)nombre ConDescripcion:(NSString *)descripcion ConLatitud:(double)latitud ConLongitud:(double)longitud{
    if (self == [super init]) {
        _nombre = nombre;
        _descripcion = descripcion;
        _latitud = latitud;
        _longitud = longitud;
    }
    return self;
}

-(id)initConCodigo:(int)codigo ConNombre:(NSString *)nombre ConDescripcion:(NSString *)descripcion ConLatitud:(double)latitud ConLongitud:(double)longitud{
    if (self == [super init]) {
        _codigo = codigo;
        _nombre = nombre;
        _descripcion = descripcion;
        _latitud = latitud;
        _longitud = longitud;
    }
    return self;
}

@end
