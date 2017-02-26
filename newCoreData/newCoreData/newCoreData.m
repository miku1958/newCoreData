//
//  newCoreData.m
//  newCoreData
//
//  Created by mikun on 2017/2/5.
//  Copyright © 2017年 mikun. All rights reserved.
//

#import "newCoreData.h"
@interface newCoreData(){
//	NSString *dataBaseName;
	NSManagedObjectContext* appContext;
//	NSPersistentContainer *persistentContainer;
}
@end

@implementation newCoreData


+(newCoreData *)coreDataWithModelName:(NSString *)name{
	newCoreData *cd = [[newCoreData alloc]init];
	NSPersistentContainer *persistentContainer = [[NSPersistentContainer alloc] initWithName:name];
	[persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
	}];
//	cd->persistentContainer = persistentContainer;
	cd->appContext = persistentContainer.viewContext;
//	cd->dataBaseName = name;
	
	return cd;
}


+(newCoreData *)coreDataWithModelName:(NSString *)name atPath:(NSString *)path{
	newCoreData *cd = [[newCoreData alloc]init];
	//创建上下文
	NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];

	
	NSURL *modelURL = [[NSBundle mainBundle] URLForResource:name withExtension:@"momd"];
	//拓展名是momd，不要改：
	NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
	
	//持久化存储调度器
	//持久化，把数据保存到一个文件，而不是内存
	NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];

	//实现持久化
	[store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:path] options:nil error:nil];
	//上下文关连数据库，关联的时候，如果本地没有数据库文件，Ｃoreadata自己会创建
	context.persistentStoreCoordinator = store;
	
	cd->appContext = context;
	return cd;
}

+(newCoreData *)coreDataMainQueueOnlyWithModelName:(NSString *)name atPath:(NSString *)path{
	newCoreData *cd = [[newCoreData alloc]init];
	//创建上下文
	NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];

	
	NSURL *modelURL = [[NSBundle mainBundle] URLForResource:name withExtension:@"momd"];
	//拓展名是momd，不要改：
	NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
	
	//持久化存储调度器
	//持久化，把数据保存到一个文件，而不是内存
	NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
	
	//实现持久化
	[store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:path] options:nil error:nil];
	//上下文关连数据库，关联的时候，如果本地没有数据库文件，Ｃoreadata自己会创建
	context.persistentStoreCoordinator = store;
	
	cd->appContext = context;
	return cd;
}


-(__kindof NSManagedObject *)createObjectWihtEntityName:(NSString *)name{
	return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:appContext];

}
-(NSArray *)selectWithRequest:(NSFetchRequest*)request{
	return [appContext executeFetchRequest:request error:nil];;
}
-(void)deleteObject:(NSManagedObject*)obj{
	[appContext deleteObject:obj];
	[self updateDataBase];
}

- (NSError *)updateDataBase {
	NSError *error = nil;
	
	[appContext save:&error];
	
	return error;
}


@end
