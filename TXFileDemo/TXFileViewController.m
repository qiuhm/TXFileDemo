//
//  TXFileViewController.m
//  TXFileDemo
//
//  Created by tingxuan.qhm on 14-4-7.
//  Copyright (c) 2014年 tingxuan.qhm. All rights reserved.
//

#import "TXFileViewController.h"

@interface TXFileViewController ()
@property(nonatomic,strong)NSString * cachePath;    //缓存的目录路径
@property(nonatomic,strong)NSString * libraryPath;    //library的目录路径
@property(nonatomic,strong)NSString * documentsPath;    //documents的目录路径
@property(nonatomic,strong)NSString * tmpPath;    //tmp的目录路径



@end

@implementation TXFileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self getSandboxPath];
    UILabel *cacheLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 480, 90)];
    [cacheLabel setText:[[NSString stringWithFormat:@"缓存为："]stringByAppendingString:self.cachePath]];
    [cacheLabel setNumberOfLines:0];
    cacheLabel.textColor=[UIColor redColor];
    [self.view addSubview:cacheLabel];
    
    UILabel *libraryLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 480, 90)];
    [libraryLabel setText:[[NSString stringWithFormat:@"library为："]stringByAppendingString:self.libraryPath]];
    [libraryLabel setNumberOfLines:0];
       libraryLabel.textColor=[UIColor blueColor];
    [self.view addSubview:libraryLabel];
    
    UILabel *documentsLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 180, 480, 90)];
    [documentsLabel setText:[[NSString stringWithFormat:@"documents为："]stringByAppendingString:self.documentsPath]];
    [documentsLabel setNumberOfLines:0];
     documentsLabel.textColor=[UIColor purpleColor];
    [self.view addSubview:documentsLabel];
    
    UILabel *tmpLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 250, 480, 90)];
    [tmpLabel setText:[[NSString stringWithFormat:@"tmp为："]stringByAppendingString:self.tmpPath]];
    [tmpLabel setNumberOfLines:0];
     tmpLabel.textColor=[UIColor orangeColor];
    [self.view addSubview:tmpLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark getSandboxPath
-(void)getSandboxPath
{
    NSArray*paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    self.cachePath = [paths objectAtIndex:0];
    
    NSArray*pathsLib =NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    self.libraryPath = [pathsLib objectAtIndex:0];
    
    NSArray*pathsDoc =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    self.documentsPath = [pathsDoc objectAtIndex:0];
    
    self.tmpPath = NSTemporaryDirectory();
}

@end
