//
//  datosRtes.m
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import "datosRtes.h"

@implementation datosRtes



//listado de datos para rellenar la BBDD

-(void)guardarBBDD{
    NSLog(@"Vamos a rellenar la BBDD");
    Restaurante *rte1 = [[Restaurante alloc]initConNombre:@"Asador de Orgaz" ConDescripcion:@"Donde disfrutar de los mejores asados de Madrid" ConLatitud:40.46 ConLongitud:-3.63];
    
    Restaurante *rte2 = [[Restaurante alloc]initConNombre:@"El Punto" ConDescripcion:@"Donde llevar a tu família y disfrutar" ConLatitud:40.5 ConLongitud:-3.5];
    
    Restaurante *rte3 = [[Restaurante alloc]initConNombre:@"La Puigmola" ConDescripcion:@"Donde disfrutar de las mejores paellas de Valencia" ConLatitud:39.01 ConLongitud:-0.32];
    
    Restaurante *rte4 = [[Restaurante alloc]initConNombre:@"Barracuda" ConDescripcion:@"Donde poder disfrutar de una buena compañía a un buen precio, a primera línea de playa" ConLatitud:38.99 ConLongitud:-0.15];
    
    
    DaoRte *dao = [DaoRte new];
    
    [dao guardarRestaurante:rte1];
    [dao guardarRestaurante:rte2];
    [dao guardarRestaurante:rte3];
    [dao guardarRestaurante:rte4];
    
    
}

-(BOOL)estableciendoPrimeraConexion{
    BOOL existe = NO;
    
    DaoRte *dao = [DaoRte new];
    NSMutableArray *listado = [dao listarRestaurantes];
    
    for (Restaurante *rte in listado) {
        NSLog(@"La BBDD está llena %@", rte.nombre);
        existe = YES;
        break;
    }
    
    return existe;
}


@end
