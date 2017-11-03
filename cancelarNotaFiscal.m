#import <Foundation/Foundation.h>

NSDictionary *headers = @{ @"cache-control": @"no-cache",
                           @"content-type": @"application/json",
                           @"x-consumer-key": @"SEU_CONSUMER_KEY",
                           @"x-consumer-secret": @"SEU_CONSUMER_SECRET",
                           @"x-access-token": @"SEU_ACCESS_TOKEN",
                           @"x-access-token-secret": @"SEU_ACCESS_TOKEN_SECRET" };
NSDictionary *parameters = @{ @"chave": @"45150819652219000198550990000000011442380343",
                              @"motivo": @"Cancelamento por motivos administrativos.",
                              @"ambiente": @"1" };

NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://webmaniabr.com/api/1/nfe/cancelar/"]
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
