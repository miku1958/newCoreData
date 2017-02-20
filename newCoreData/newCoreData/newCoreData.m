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
