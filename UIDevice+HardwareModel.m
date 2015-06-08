//
//  UIDevice+HardwareModel.m
//
//  Created by Heiko Dreyer on 05/11/11.
//  Copyright 2011 boxedfolder.com. All rights reserved.
//

#import "UIDevice+HardwareModel.h"
#include <sys/sysctl.h>

@implementation UIDevice (HighHardwareModel)
- (NSString *)highHardwareName
{
	NSString *name = @"Unknown";
	
	switch ([self highHardwareModel]) {
		case UIHighHardwareModeliPad:
			name = @"iPad 1G";
			break;
		case UIHighHardwareModeliPad2CDMA:
			name = @"iPad 2 CDMA";
			break;
		case UIHighHardwareModeliPad2GSM:
			name = @"iPad 2 GSM";
			break;
		case UIHighHardwareModeliPad2Wifi:
			name = @"iPad 2 Wifi";
			break;
		case UIHighHardwareModeliPad3CDMA:
			name = @"iPad 3 CDMA";
			break;
		case UIHighHardwareModeliPad3GSM:
			name = @"iPad 3 GSM";
			break;
		case UIHighHardwareModeliPad3Wifi:
			name = @"iPad 3 Wifi";
			break;
		case UIHighHardwareModeliPad4CDMA:
			name = @"iPad 4 CDMA";
			break;
		case UIHighHardwareModeliPad4GSM:
			name = @"iPad 4 GSM";
			break;
		case UIHighHardwareModeliPad4Wifi:
			name = @"iPad 4 Wifi";
			break;
		case UIHighHardwareModeliPadMiniCDMA:
			name = @"iPad mini CDMA";
			break;
		case UIHighHardwareModeliPadMiniGSM:
			name = @"iPad mini GSM";
			break;
		case UIHighHardwareModeliPadMiniWifi:
			name = @"iPad mini Wifi";
			break;
		case UIHighHardwareModeliPhone1G:
			name = @"iPhone 1G";
			break;
		case UIHighHardwareModeliPhone3G:
			name = @"iPhone 3G";
			break;
		case UIHighHardwareModeliPhone3GS:
			name = @"iPhone 3Gs";
			break;
		case UIHighHardwareModeliPhone4:
			name = @"iPhone 4";
			break;
		case UIHighHardwareModeliPhone4S:
			name = @"iPhone 4s";
			break;
		case UIHighHardwareModeliPhone4Verizon:
			name = @"iPhone 4 Verizon";
			break;
		case UIHighHardwareModeliPhone5:
			name = @"iPhone 5";
			break;
		case UIHighHardwareModeliPhone5c:
			name = @"iPhone 5c";
			break;
		case UIHighHardwareModeliPhone5cGlobal:
			name = @"iPhone 5c Global";
			break;
		case UIHighHardwareModeliPhone5Global:
			name = @"iPhone 5 Global";
			break;
		case UIHighHardwareModeliPhone5s:
			name = @"iPhone 5s";
			break;
		case UIHighHardwareModeliPhone5sGlobal:
			name = @"iPhone 5s Global";
			break;
		case UIHighHardwareModeliPodTouch1G:
			name = @"iPod 1G";
			break;
		case UIHighHardwareModeliPodTouch2G:
			name = @"iPod 2G";
			break;
		case UIHighHardwareModeliPodTouch3G:
			name = @"iPod 3G";
			break;
		case UIHighHardwareModeliPodTouch4G:
			name = @"iPod 4G";
			break;
		case UIHighHardwareModeliPodTouch5G:
			name = @"iPod 5G";
			break;
		case UIHighHardwareModelSimulator:
			name = @"Simulator";
			break;
		case UIHighHardwareModeliPhone6Plus:
			name = @"iPhone 6 Plus";
			break;
		case UIHighHardwareModeliPhone6:
			name = @"iPhone 6";
			break;
		default:
			name = @"Unknown";
			break;
	}
	
	return name;
}
-(UIHighHardwareModel)highHardwareModel
{
	static UIHighHardwareModel _hardwareModel;
	
	if(!_hardwareModel)
	{
		size_t size;
		char *model;
		
		sysctlbyname("hw.machine", NULL, &size, NULL, 0);
		model = malloc(size);
		sysctlbyname("hw.machine", model, &size, NULL, 0);
		
		NSString *hwString = [NSString stringWithCString: model encoding: NSUTF8StringEncoding];
		free(model);
        
        _hardwareModel = UIHighHardwareModelUnknown; // Unknown by default
		
		if([hwString isEqualToString: @"i386"] || [hwString isEqualToString:@"x86_64"])   
			_hardwareModel = UIHighHardwareModelSimulator;
		
		if([hwString isEqualToString: @"iPhone1,1"])    
			_hardwareModel = UIHighHardwareModeliPhone1G;
		
		if([hwString isEqualToString: @"iPhone1,2"])   
			_hardwareModel = UIHighHardwareModeliPhone3G;
		
		if([hwString isEqualToString: @"iPhone2,1"])  
			_hardwareModel = UIHighHardwareModeliPhone3GS;
		
		if([hwString isEqualToString: @"iPhone3,1"]) 
			_hardwareModel = UIHighHardwareModeliPhone4;
		
		if([hwString isEqualToString: @"iPhone3,2"]) 
			_hardwareModel = UIHighHardwareModeliPhone4Verizon;
        
		if([hwString isEqualToString: @"iPhone4,1"]) 
			_hardwareModel = UIHighHardwareModeliPhone4S;
		
		if([hwString isEqualToString: @"iPod1,1"])  
			_hardwareModel = UIHighHardwareModeliPodTouch1G;
		
		if([hwString isEqualToString: @"iPod2,1"]) 
			_hardwareModel = UIHighHardwareModeliPodTouch2G;
		
		if([hwString isEqualToString: @"iPod3,1"])    
			_hardwareModel = UIHighHardwareModeliPodTouch3G;
		
		if([hwString isEqualToString: @"iPod4,1"]) 
			_hardwareModel = UIHighHardwareModeliPodTouch4G;
		
		if([hwString isEqualToString: @"iPad1,1"]) 
			_hardwareModel = UIHighHardwareModeliPad;
		
		if([hwString isEqualToString: @"iPad2,1"])   
			_hardwareModel = UIHighHardwareModeliPad2Wifi;
		
		if([hwString isEqualToString: @"iPad2,2"])   
			_hardwareModel = UIHighHardwareModeliPad2GSM;
		
		if([hwString isEqualToString: @"iPad2,3"])      
			_hardwareModel = UIHighHardwareModeliPad2CDMA;
			
		if([hwString isEqualToString: @"iPad2,4"])      
			_hardwareModel = UIHighHardwareModeliPad2Wifi;
        
		if([hwString isEqualToString: @"iPad3,1"])     
			_hardwareModel = UIHighHardwareModeliPad3Wifi;
        
		if([hwString isEqualToString: @"iPad3,2"])     
			_hardwareModel = UIHighHardwareModeliPad3GSM;
        
		if([hwString isEqualToString: @"iPad3,3"])     
			_hardwareModel = UIHighHardwareModeliPad3CDMA;
        
		if([hwString isEqualToString: @"iPhone5,1"])
			_hardwareModel = UIHighHardwareModeliPhone5;
        
		if([hwString isEqualToString: @"iPhone5,2"])
			_hardwareModel = UIHighHardwareModeliPhone5Global;
        
		if([hwString isEqualToString: @"iPhone5,3"])
			_hardwareModel = UIHighHardwareModeliPhone5c;
        
		if([hwString isEqualToString: @"iPhone5,4"])
			_hardwareModel = UIHighHardwareModeliPhone5cGlobal;
        
		if([hwString isEqualToString: @"iPhone6,1"])
			_hardwareModel = UIHighHardwareModeliPhone5s;
        
		if([hwString isEqualToString: @"iPhone6,2"])
			_hardwareModel = UIHighHardwareModeliPhone5sGlobal;
        
		if([hwString isEqualToString: @"iPod5,1"])
			_hardwareModel = UIHighHardwareModeliPodTouch5G;
        
		if([hwString isEqualToString: @"iPad2,5"])
			_hardwareModel = UIHighHardwareModeliPadMiniWifi;
        
		if([hwString isEqualToString: @"iPad2,6"])
			_hardwareModel = UIHighHardwareModeliPadMiniGSM;
			
		if([hwString isEqualToString: @"iPad2,7"])
			_hardwareModel = UIHighHardwareModeliPadMiniCDMA;
        
		if([hwString isEqualToString: @"iPad3,4"])
			_hardwareModel = UIHighHardwareModeliPad4Wifi;
        
		if([hwString isEqualToString: @"iPad3,5"])
			_hardwareModel = UIHighHardwareModeliPad4GSM;
			
		if([hwString isEqualToString: @"iPad3,6"])
			_hardwareModel = UIHighHardwareModeliPad4CDMA;
            
        if([hwString isEqualToString: @"iPhone7,1"])
            _hardwareModel = UIHighHardwareModeliPhone6Plus;
        
        if([hwString isEqualToString: @"iPhone7,2"])
            _hardwareModel = UIHighHardwareModeliPhone6;
	}
	
	return _hardwareModel;
}

@end
