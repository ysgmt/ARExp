//
//  ViewController.m
//  ARExp
//
//  Created by Yutaro Sugimoto on 2014/10/31.
//  Copyright (c) 2014年 y.sgmt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // load our tracking configuration
    // NSString* trackingDataFile = [[NSBundle mainBundle] pathForResource:@"TrackingData_MarkerlessFast"
    //                                                              ofType:@"xml"
    //                                                         inDirectory:@"Assets"];
    NSString* trackingDataFile = [[NSBundle mainBundle] pathForResource:@"trackingDataQR4" ofType:@"zip"];

    if(trackingDataFile)
    {
        const char *utf8Path = [trackingDataFile UTF8String];
        bool success = m_pMetaioSDK->setTrackingConfiguration(metaio::Path::fromUTF8(utf8Path));
        if( !success)
            NSLog(@"No success loading the tracking configuration");
    }
    
    
    // load content
    // NSString* metaioManModel = [[NSBundle mainBundle] pathForResource:@"metaioman"
    //                                                           ofType:@"md2"
    //                                                    inDirectory:@"Assets"];
    NSString* metaioManModel = [[NSBundle mainBundle] pathForResource:@"reversedRedCup5" ofType:@"zip"];
    
    
    if(metaioManModel)
    {
        // if this call was successful, theLoadedModel will contain a pointer to the 3D model
        const char *utf8Path = [metaioManModel UTF8String];
        metaio::IGeometry* theLoadedModel =  m_pMetaioSDK->createGeometry(metaio::Path::fromUTF8(utf8Path));
        if( theLoadedModel )
        {
            // scale it a bit up
            theLoadedModel->setScale(metaio::Vector3d(30.0,30.0,30.0));
            // theLoadedModel->setRotation(metaio::Rotation(metaio::Vector3d(0,0,0)));
        }
        else
        {
            NSLog(@"error, could not load %@", metaioManModel);
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
