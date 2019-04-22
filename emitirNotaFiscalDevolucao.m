#import <Foundation/Foundation.h>

NSDictionary *headers = @{ @"Cache-Control": @"no-cache",
                           @"Content-Type": @"application/json",
                           @"X-Consumer-Key": @"SEU_CONSUMER_KEY",
                           @"X-Consumer-Secret": @"SEU_CONSUMER_SECRET",
                           @"X-Access-Token": @"SEU_ACCESS_TOKEN",
                           @"X-Access-Token-Secret": @"SEU_ACCESS_TOKEN_SECRET"};
                           
NSDictionary *parameters = @{ @"chave": @"00000000000000000000000000000000000000000000",
                              @"natureza_operacao": @"Devolução de venda de produção do estabelecimento",
                              @"codigo_cfop": @"1.202",
                              @"produtos": @[ @2, @3 ],
                              @"ambiente": @"1" };

NSDictionary *parameters = @{ @"chave": @"00000000000000000000000000000000000000000000",
                              @"natureza_operacao": @"Devolução de venda de produção do estabelecimento",
                              @"codigo_cfop": @"1.202",
                              @"produtos": @[ @2, @3 ],
                              @"ambiente": @"1" };

NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://webmaniabr.com/api/1/nfe/devolucao/"]
                                                       cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                   timeoutInterval:10.0];
[request setHTTPMethod:@"POST"];
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