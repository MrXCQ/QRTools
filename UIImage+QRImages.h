//
//  UIImage+QRImages.h
//  QRTools
//
//  Created by zc on 2017/11/29.
//  Copyright © 2017年 IMpBear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRImages)
/**
 * 返回二维码图片
 */

+(UIImage *)productQRcodeImgeWithContent:(NSString *)content size:(CGSize)size ;
@end
