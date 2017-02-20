//
//  Abc+CoreDataProperties.m
//  newCoreData
//
//  Created by mikun on 2017/2/5.
//  Copyright © 2017年 mikun. All rights reserved.
//

#import "Abc+CoreDataProperties.h"

@implementation Abc (CoreDataProperties)

+ (NSFetchRequest<Abc *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Abc"];
}

@dynamic stud;

@end
