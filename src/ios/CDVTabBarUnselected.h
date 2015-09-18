#import "CDV.h"
#import "CDVPlugin.h"

@interface CDVTabBarUnselected : CDVPlugin
- (void) setColorforUnselected:(CDVInvokedUrlCommand*)command;
- (void)listSubviewsOfView:(UIView *)view;
@end
