#import "AppIdFetcherLoader.h"
#import <POSUtils/POSUtils-Swift.h>

@implementation AppIdFetcherLoader

+ (void)load {
    AppIdFetcher *appIdFetcher = [[AppIdFetcher alloc] init];
    [appIdFetcher getIdWithCompletion:^(NSInteger appId) {}];
}

@end
