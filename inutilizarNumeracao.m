#import <Foundation/Foundation.h>

NSDictionary *headers = @{ @"Cache-Control": @"no-cache",
                           @"Content-Type": @"application/json",
                           @"X-Consumer-Key": @"SEU_CONSUMER_KEY",
                           @"X-Consumer-Secret": @"SEU_CONSUMER_SECRET",
                           @"X-Access-Token": @"SEU_ACCESS_TOKEN",
                           @"X-Access-Token-Secret": @"SEU_ACCESS_TOKEN_SECRET"};
                           
NSDictionary *parameters = @{ @"sequencia": @"101-109",
                              @"motivo": @"Inutilização por problemas técnicos.",
                              @"ambiente": @"2",
                              @"serie": @"99",
                              @"modelo": @"1" };

NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://webmaniabr.com/api/1/nfe/inutilizar/"]
                                                       cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                   timeoutInterval:10.0];
[request setHTTPMethod:@"PUT"];
[request setAllHTTPHeaderFields:headers];
[request setHTTPBody:postData];

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