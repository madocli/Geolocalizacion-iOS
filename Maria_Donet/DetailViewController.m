//
//  DetailViewController.m
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbNombre;
@property (weak, nonatomic) IBOutlet UITextView *tfDescripcion;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lbNombre.text = _restauranteSeleccionado.nombre;
    _tfDescripcion.text = _restauranteSeleccionado.descripcion;
    
    CLLocationCoordinate2D location;
    location.latitude = _restauranteSeleccionado.latitud;
    location.longitude = _restauranteSeleccionado.longitud;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 500, 500);
    
    //mostramos en el mapa
    _mapa.region = region;
    _mapa.delegate = self;
}

//Esta función se ejecuta justo después del "viewDidLoad"
-(void)viewWillAppear:(BOOL)animated{
    
    //también podemos poner anotaciones (Markes en Android, rollo "chinchetas")
    CLLocationCoordinate2D location;
    location.latitude = _restauranteSeleccionado.latitud;
    location.longitude = _restauranteSeleccionado.longitud;
    
    MKPointAnnotation *anotacion = [MKPointAnnotation new];
    anotacion.coordinate = location;
    
    anotacion.title = [NSString stringWithFormat:@"%@ %.02f %.02f",_restauranteSeleccionado.nombre, _restauranteSeleccionado.latitud, _restauranteSeleccionado.longitud];
    
    [_mapa addAnnotation: anotacion];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"destruyendo vista detail");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
