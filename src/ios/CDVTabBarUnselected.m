#import "CDVTabBarUnselected.h"
#import "UIImage+Overlay.h"

@implementation CDVTabBarUnselected
- (void)pluginInitialize
{
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    [tabBar setTintColor:[UIColor blueColor]];
    UIColor * unselectedColor = [UIColor whiteColor];
    for(UITabBarItem *item in tabBar.items) {
        item.image = [[item.selectedImage imageWithColor:unselectedColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }

}

- (void)setColorforUnselected:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = [command callbackId];
    NSString* name = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    [self success:result callbackId:callbackId];
}

@end



