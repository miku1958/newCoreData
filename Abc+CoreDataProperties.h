//
//  Abc+CoreDataProperties.h
//  newCoreData
//
//  Created by mikun on 2017/2/5.
//  Copyright © 2017年 mikun. All rights reserved.
//

#import "Abc+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Abc (CoreDataProperties)

+ (NSFetchRequest<Abc *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *stud;

@end

NS_ASSUME_NONNULL_END
