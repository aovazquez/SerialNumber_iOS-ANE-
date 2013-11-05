//
//  serialLib.h
//  infoANE
//
//  Created by Angel Vazquez on 16/08/13.
//  Copyright (c) 2013 Angel Vazquez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIDevice (serialNumber)

@property(nonatomic, readonly)NSString * serialNumber;

@end
