//
//  NSObject+GNUStepAddons_h.m
//  Wallet
//
//  Created by Izabela on 11/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import "NSObject+GNUStepAddons_h.h"
#import <objc/runtime.h>

@implementation NSObject (GNUStepAddons_h)

-(id) subclassResponsibility: (SEL) aSel{
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    [NSException raise:NSInvalidArgumentException format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    return self;
}


@end
