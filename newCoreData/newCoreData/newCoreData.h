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
#pragma mark - 初始化方法：
/** 使用数据库名字返回一个默认路径的管理器 */
+(newCoreData *)coreDataWithModelName:(NSString *)name;

/** 使用数据库名字和保存数据库的路径返回一个管理器，使用NSPrivateQueueConcurrencyType允许子线程执行 */
+(newCoreData *)coreDataWithModelName:(NSString *)name atPath:(NSString *)path;

/** 使用数据库名字和保存数据库的路径返回一个管理器，使用NSMainQueueConcurrencyType只在子线程执行 */
+(newCoreData *)coreDataMainQueueOnlyWithModelName:(NSString *)name atPath:(NSString *)path;


#pragma mark - 操作数据库
/** 创建一个新的对象,修改完对象需要调用updateDataBase更新才能完成插入对象 */
-(__kindof NSManagedObject *)createObjectWihtEntityName:(NSString *)name;

/** 使用NSFetchRequest来查询对象 */
-(NSArray *)selectWithRequest:(NSFetchRequest*)request;

/** 强制保存数据库，当selectWithRequest后对数据库对象进行修改（deleteObject不需要），需要调用这个 */
- (NSError *)updateDataBase;

/** 删除对象,需要先调用selectWithRequest拿到对象数组,遍历数组调用这个方法传入对象 */
-(void)deleteObject:(NSManagedObject*)obj;
@end
