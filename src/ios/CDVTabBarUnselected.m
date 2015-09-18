#import "CDVTabBarUnselected.h"
#import "UIImage+Overlay.h"

@implementation CDVTabBarUnselected


- (void)setColorforUnselected:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = [command callbackId];
    NSString* color = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Hello, %@", color];



    UIViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    if (rootViewController == nil)
        NSLog(@"Error- No Root Found"); 

    UITabBarController *tabBarController = (UITabBarController *)rootViewController;
    if (tabBarController == nil)
        NSLog(@"Error- No Tab Controller Found"); 

    UITabBar *tabBar = tabBarController.tabBar;
    
    if (tabBarController == nil)
        NSLog(@"Error- No Tab Bar Found"); 

    [tabBar setTintColor:[UIColor blueColor]];
    UIColor * unselectedColor = [UIColor whiteColor];
    for(UITabBarItem *item in tabBar.items) {
        item.image = [[item.selectedImage imageWithColor:unselectedColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }

    CDVPluginResult* presult = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    [self.commandDelegate sendPluginResult:presult callbackId:callbackId];

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



