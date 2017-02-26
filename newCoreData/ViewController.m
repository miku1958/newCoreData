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
	abc.stud = @"newStud";
	[cd updateDataBase];
	NSFetchRequest *request = [Abc fetchRequest];
	
	NSArray *array = [cd selectWithRequest:request];
	
	[array enumerateObjectsUsingBlock:^(Abc* obj, NSUInteger idx, BOOL * _Nonnull stop) {
//删除对象：
		//[cd deleteObject:obj];
//修改对象的属性：
		//obj.stud = @"efg";
	}];
//修改对象后保存数据库
	//[cd updateDataBase];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
