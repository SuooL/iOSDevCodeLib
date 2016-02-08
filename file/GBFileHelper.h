//
//  GBFileHelper.h
//  GBiOSHello
//
//  Created by 胡振生 on 16/2/8.
//  Copyright © 2016年 胡振生. All rights reserved.
//  文件处理帮助类

#import <Foundation/Foundation.h>

@interface GBFileHelper : NSObject
// 获取 Document 目录路径
-(NSString *)getDocumentsPath;
// 创建文件夹及文件
-(void)createFileWithName:(NSString *) fileName
               fileFolder:(NSString *) docFolder;

// 写指定内容进入文件
-(void)writeToFile:(NSString *) fileName
        fileFolder:(NSString *) docFolder
       fileContent:(NSString *) content;
// 从文件中读取内容
-(NSString *)readFromFile:(NSString *) fileName
               fileFolder:(NSString *) docFolder;

// [URLForResource:withExtension:]方法 读取文件
-(NSString *)readFromFile:(NSString *)fileName fileExtension:(NSString *)extension;
@end
