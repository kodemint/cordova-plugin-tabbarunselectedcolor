#import "CDVTabBarUnselected.h"
#import "UIImage+Overlay.h"

@implementation CDVTabBarUnselected

#ifndef __IPHONE_3_0
@synthesize webView;
#endif

- (void)setColorforUnselected:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = [command callbackId];
    NSString* color = [[command arguments] objectAtIndex:0];
    
    UITabBarController *tabBarController = (UITabBarController *)self.viewController.tabBarController;
    
    if (tabBarController == nil)
    {
        CDVPluginResult* presult = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

        [self.commandDelegate sendPluginResult:presult callbackId:callbackId];

        NSLog(@"Error- No Tab Controller Found"); 
    }
    else
    {
        UITabBar *tabBar = tabBarController.tabBar;
        
        if (tabBar == nil)
            NSLog(@"Error- No Tab Bar Found"); 

        UIColor * unselectedColor = [self colorStringToColor:color];
        for(UITabBarItem *item in tabBar.items) {
            item.image = [[item.selectedImage imageWithColor:unselectedColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }

    }
}

- (UIColor*)colorStringToColor:(NSString*)colorStr
{
    NSArray *rgba = [colorStr componentsSeparatedByString:@","];
    return [UIColor colorWithRed:[[rgba objectAtIndex:0] intValue]/255.0f
                           green:[[rgba objectAtIndex:1] intValue]/255.0f
                            blue:[[rgba objectAtIndex:2] intValue]/255.0f
                           alpha:[[rgba objectAtIndex:3] intValue]/255.0f];
}

@end



