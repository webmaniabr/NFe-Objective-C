#import <Foundation/Foundation.h>

NSDictionary *headers = @{ @"cache-control": @"no-cache",
                           @"content-type": @"application/json",
                           @"x-consumer-key": @"SEU_CONSUMER_KEY",
                           @"x-consumer-secret": @"SEU_CONSUMER_SECRET",
                           @"x-access-token": @"SEU_ACCESS_TOKEN",
                           @"x-access-token-secret": @"SEU_ACCESS_TOKEN_SECRET" };

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://webmaniabr.com/api/1/nfe/consulta/?chave=45150819652219000198550990000000011442380343&ambiente=1"]
                                                       cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                   timeoutInterval:10.0];
[request setHTTPMethod:@"GET"];
[request setAllHTTPHeaderFields:headers];

NSURLSession *session = [NSURLSession sharedSession];
NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error) {
                                                    NSLog(@"%@", error);
                                                } else {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                    NSLog(@"%@", httpResponse);
                                                }
                                            }];
[dataTask resume];
