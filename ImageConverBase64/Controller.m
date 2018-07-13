//
//  Controller.m
//  ImageConverBase64
//
//  Created by 李一贤 on 2018/7/13.
//  Copyright © 2018年 李一贤. All rights reserved.
//  源码参考：https://www.cnblogs.com/ZGSmile/articles/5587226.html
//  https://www.jianshu.com/p/6f330ac3f93a

#import "Controller.h"

@implementation Controller


//UIImage图片转成Base64字符串：
+(NSString*)imageConvertToBase64:(UIImage*)originImage{
  
    if (originImage) {
        //无论怎样，返回png格式
        NSData *data = UIImagePNGRepresentation(originImage);
        NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        return encodedImageStr;
    }
    else{
        return nil;
    }
}


//Base64字符串转UIImage图片：
+(UIImage*)Base64ConvertToImage:(NSString*)base64String{
    if (base64String&&![base64String isEqualToString:@""]) {
        NSData *decodedImageData = [[NSData alloc]
                                    
                                    initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
        
        UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
        return decodedImage;
    }
    else
    {
        return nil;
    }
}

//获取传入图片的真实类型：取出图片数据的第一个字节, 就可以判断出图片的真实类型
+(NSString*)getImageType:(UIImage*)image{
    
    NSData *data = UIImagePNGRepresentation(image);
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

@end
