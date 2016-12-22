//
//  AppDelegate.m
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import "AppDelegate.h"
#import "RteBBDD.h"
#import "datosRtes.h"
/*#import "DaoRte.h"*/

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //para poder utilizar la BBDD tenemos que establecer conexión
    RteBBDD *rteBBDD = [[RteBBDD alloc]init];
    [rteBBDD crearTablaRestaurantes];
    
    //Aquí deberemos comprobar si la bbdd está hecha, si no está hecha se creará:
    //Se ha creado una nueva clase que si es la primera vez que se instancia la clase
    datosRtes *datos = [datosRtes new];
    BOOL existe = [datos estableciendoPrimeraConexion];
    
    if (existe == YES) {
        NSLog(@"La BBDD está rellena, método FinishLaunching");
    } else if (existe == NO){
        NSLog(@"Llamando para rellenar datos");
        [datos guardarBBDD];
        
        /*
        Restaurante *rte1 = [[Restaurante alloc]initConNombre:@"Asador de Orgaz" ConDescripcion:@"Donde disfrutar de los mejores asados de Madrid" ConLatitud:40.46 ConLongitud:-3.63];
        
        Restaurante *rte2 = [[Restaurante alloc]initConNombre:@"El Punto" ConDescripcion:@"Donde llevar a tu família y disfrutar" ConLatitud:40.5 ConLongitud:-3.5];
        
        Restaurante *rte3 = [[Restaurante alloc]initConNombre:@"La Puigmola" ConDescripcion:@"Donde disfrutar de las mejores paellas de Valencia" ConLatitud:39.01 ConLongitud:-0.32];
        
        Restaurante *rte4 = [[Restaurante alloc]initConNombre:@"Barracuda" ConDescripcion:@"Donde poder disfrutar de una buena compañía a un buen precio, a primera línea de playa" ConLatitud:38.99 ConLongitud:-0.15];
        
       
        DaoRte *dao = [DaoRte new];
        
        [dao guardarRestaurante:rte1];
        [dao guardarRestaurante:rte2];
        [dao guardarRestaurante:rte3];
        [dao guardarRestaurante:rte4];
        NSLog(@"Guardado en bbdd %@, %@, %@, %@", rte1.nombre, rte2.nombre, rte3.nombre, rte4.nombre);
        
        existe = YES;*/
        
        
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
