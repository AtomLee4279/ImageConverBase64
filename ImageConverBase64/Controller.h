//
//  Controller.h
//  ImageConverBase64
//
//  Created by 李一贤 on 2018/7/13.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Controller : NSObject

+(NSString*)imageConvertToBase64:(UIImage*)originImage;

+(UIImage*)Base64ConvertToImage:(NSString*)base64String;

@end
