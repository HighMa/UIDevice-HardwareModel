//
//  UIDevice+HardwareModel.h
//
//  Created by Heiko Dreyer on 05/11/11.
//  Copyright 2011 boxedfolder.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIHighHardwareModel) {
    UIHighHardwareModelUnknown = 0,
    UIHighHardwareModelSimulator = 1,
    
    UIHighHardwareModeliPhone1G = 2,
    UIHighHardwareModeliPhone3G = 3,
    UIHighHardwareModeliPhone3GS = 4,
    UIHighHardwareModeliPhone4 = 5,
    UIHighHardwareModeliPhone4Verizon = 6,
    
    UIHighHardwareModeliPodTouch1G = 7,
    UIHighHardwareModeliPodTouch2G = 8,
    UIHighHardwareModeliPodTouch3G = 9,
    UIHighHardwareModeliPodTouch4G = 10,
    
    UIHighHardwareModeliPad = 11,
    UIHighHardwareModeliPad2Wifi = 12,
    UIHighHardwareModeliPad2GSM = 13,
    UIHighHardwareModeliPad2CDMA = 14,
    
    UIHighHardwareModeliPhone4S = 15,
    
    UIHighHardwareModeliPad3Wifi = 16,
    UIHighHardwareModeliPad3GSM = 17,
    UIHighHardwareModeliPad3CDMA = 18,
    
    UIHighHardwareModeliPhone5 = 19,
    UIHighHardwareModeliPhone5Global = 20,
    
    UIHighHardwareModeliPodTouch5G = 21,
    
    UIHighHardwareModeliPadMiniWifi = 22,
    UIHighHardwareModeliPadMiniGSM = 23,
    UIHighHardwareModeliPadMiniCDMA = 24,
    UIHighHardwareModeliPad4Wifi = 25,
    UIHighHardwareModeliPad4GSM = 26,
    UIHighHardwareModeliPad4CDMA = 27,
    
    UIHighHardwareModeliPhone5c = 28,
    UIHighHardwareModeliPhone5cGlobal = 29,
    
    UIHighHardwareModeliPhone5s = 30,
    UIHighHardwareModeliPhone5sGlobal = 31,
    
    UIHighHardwareModeliPhone6 = 32,
    UIHighHardwareModeliPhone6Plus = 33
};
@interface UIDevice (HighHardwareModel) 
/**
 *	Returns hardware name of device instance
 */
- (NSString *)highHardwareName;
/**
 *	Returns hardware id of device instance
 */
-(UIHighHardwareModel)highHardwareModel;

@end
