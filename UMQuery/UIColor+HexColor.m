//
//  UIColor+HexColor.m
//  UMQuery
//
//  Created by umiao on 17/4/11.
//  Copyright © 2017年 umiao. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)
+(UIColor *)colorWithHex:(NSString *)hex{
    if ([hex hasPrefix:@"#"]) {
        if (hex.length == 4) {
            hex = [NSString stringWithFormat:@"#%c%c%c%c%c%c",
                   [hex characterAtIndex:1],
                   [hex characterAtIndex:1],
                   [hex characterAtIndex:2],
                   [hex characterAtIndex:2],
                   [hex characterAtIndex:3],
                   [hex characterAtIndex:3]];
        }
        const char * color = [[hex substringFromIndex:1] UTF8String];
        int xColor;
        if (sscanf(color, "%x",&xColor) == 1) {
            int r = (xColor >> 16) & 0xFF;
            int g = (xColor >> 8) & 0xFF;
            int b = (xColor) & 0xFF;
            return [UIColor colorWithRed:(r / 255.0f) green:(g / 255.0f) blue:(b / 255.0f) alpha:1.0f];
        }
    }
    return [UIColor clearColor];
}
+(UIColor *)randomColor{
    return [UIColor colorWithRed:arc4random_uniform(256) / 256.0 green:arc4random_uniform(256) / 256.0 blue:arc4random_uniform(256) / 256.0 alpha:1.0];
}
@end
