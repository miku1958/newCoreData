//
//  ViewController.m
//  newCoreData
//
//  Created by mikun on 2017/2/5.
//  Copyright © 2017年 mikun. All rights reserved.
//

#import "ViewController.h"
#import "newCoreData.h"
#import "Abc+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	newCoreData * cd = [newCoreData coreDataWithModelName:@"Model"];
	Abc *abc = [cd createObjectWihtEntityName:@"Abc"];
	abc.stud = @"abc";
	[cd updateDataBase];
	NSFetchRequest *request = [Abc fetchRequest];
	
	NSArray *array = [cd selectWithRequest:request];
	[array enumerateObjectsUsingBlock:^(Abc* obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[cd deleteObject:obj];
//		obj.stud = @"efg";
	}];
//	[cd updateDataBase];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
