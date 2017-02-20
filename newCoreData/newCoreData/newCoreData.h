//
//  newCoreData.h
//  newCoreData
//
//  Created by mikun on 2017/2/5.
//  Copyright © 2017年 mikun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"

@interface newCoreData : NSObject

/** 使用数据库名字返回一个管理器 */
+(newCoreData *)coreDataWithModelName:(NSString *)name;

/** 创建一个新的对象,修改完对象需要调用updateDataBase更新才能完成插入对象 */
-(__kindof NSManagedObject *)createObjectWihtEntityName:(NSString *)name;

- (NSError *)updateDataBase;

/** 使用NSFetchRequest来查询对象 */
-(NSArray *)selectWithRequest:(NSFetchRequest*)request;

/** 删除对象,需要先调用selectWithRequest拿到对象数组,遍历数组调用这个方法传入对象 */
-(void)deleteObject:(NSManagedObject*)obj;
@end
