//
//  ViewController.m
//  QRTools
//
//  Created by zc on 2017/11/29.
//  Copyright © 2017年 IMpBear. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // http://www.bbgushiji.com:833/systems/qrticket.aspx
    FMDBQueue = [[NSOperationQueue alloc]init];
    FMDBQueue.maxConcurrentOperationCount = 1 ;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"QR" ofType:@"json"]];
    
    NSDictionary *dataArray = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];

    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        
        for (NSDictionary *dic in dataArray[@"data"]) {
            UIImage *image = [UIImage  productQRcodeImgeWithContent:dic[@"qr"] size:CGSizeMake(200, 200)];
            
            NSString *path_sandox = NSHomeDirectory();
            
            NSString *imagePath = [path_sandox stringByAppendingString:[NSString stringWithFormat:@"/Documents/%@.png",dic[@"imgname"]]];

            [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
            
            NSLog(@"imagepath --- %@",imagePath);
        }
       
    }];
    
     [FMDBQueue addOperation:op1];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
