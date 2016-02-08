//
//  GBFileHelper.m
//  GBiOSHello
//
//  Created by 胡振生 on 16/2/8.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import "GBFileHelper.h"

@implementation GBFileHelper
// 获取 Document 目录路径
-(NSString *)getDocumentsPath{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"app_doc_path: %@",documentsDirectory);
    return documentsDirectory;
}
// 创建文件夹及文件
-(void)createFileWithName:(NSString *) fileName fileFolder:(NSString *) docFolder{
    NSString *documentsPath =[self getDocumentsPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileDirectory = [documentsPath stringByAppendingPathComponent:docFolder];
    // 创建目录
    BOOL res=[fileManager createDirectoryAtPath:fileDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (res) {
        NSLog(@"创建文件夹成功");
        NSString *filePath = [fileDirectory stringByAppendingPathComponent:fileName];
        BOOL res=[fileManager createFileAtPath:filePath contents:nil attributes:nil];
        if (res) {
            NSLog(@"创建文件成功: %@" ,filePath);
        }else
            NSLog(@"创建文件失败");
    }else {
        NSLog(@"创建文件夹失败");
        return;
    }
    
}

// 写指定内容进入文件
-(void)writeToFile:(NSString *) fileName fileFolder:(NSString *) docFolder fileContent:(NSString *) content{
    NSString *documentsPath =[self getDocumentsPath];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:docFolder];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:fileName];
    BOOL res=[content writeToFile:testPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (res) {
        NSLog(@"写入文件成功");
    }else
        NSLog(@"写入文件失败");
}

// 从文件中读取内容
-(NSString *)readFromFile:(NSString *) fileName fileFolder:(NSString *) docFolder{
    NSString *documentsPath =[self getDocumentsPath];
    NSString *fileDirectory = [documentsPath stringByAppendingPathComponent:docFolder];
    NSString *filePath = [fileDirectory stringByAppendingPathComponent:fileName];
    //    NSData *data = [NSData dataWithContentsOfFile:testPath];
    //    NSLog(@"文件读取成功: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString *content=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"读取文件成功: %@",content);
    return content;
}

-(NSString *)readFromFile:(NSString *)fileName fileExtension:(NSString *)extension{
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:fileName withExtension:extension];
    NSLog(@"mainBundle %@",fileUrl);
    NSString *fileContent = [NSString stringWithContentsOfURL:fileUrl encoding:NSUTF8StringEncoding error:nil];
    return fileContent;
}
@end
