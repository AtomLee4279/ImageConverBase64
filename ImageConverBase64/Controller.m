//
//  Controller.m
//  ImageConverBase64
//
//  Created by 李一贤 on 2018/7/13.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "Controller.h"

@implementation Controller


//UIImage图片转成Base64字符串：
+(NSString*)imageConvertToBase64:(UIImage*)originImage{
  
    if (originImage) {
        
        NSData *data = UIImageJPEGRepresentation(originImage, 1.0f);
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


@end
