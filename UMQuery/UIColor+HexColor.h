//
//  UIColor+HexColor.h
//  UMQuery
//
//  Created by umiao on 17/4/11.
//  Copyright © 2017年 umiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#undef HEX
#define HEX(__color) [UIColor colorWithHex:(__color)]
@interface UIColor (HexColor)
+(UIColor *)colorWithHex:(NSString *)hex;
+(UIColor *)randomColor;
@end
