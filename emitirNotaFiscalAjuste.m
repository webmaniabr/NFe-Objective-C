#import <Foundation/Foundation.h>

NSDictionary *headers = @{ @"Cache-Control": @"no-cache",
                           @"Content-Type": @"application/json",
                           @"X-Consumer-Key": @"SEU_CONSUMER_KEY",
                           @"X-Consumer-Secret": @"SEU_CONSUMER_SECRET",
                           @"X-Access-Token": @"SEU_ACCESS_TOKEN",
                           @"X-Access-Token-Secret": @"SEU_ACCESS_TOKEN_SECRET"};
                           
NSDictionary *parameters = @{ @"operacao": @1,
                              @"natureza_operacao": @"CREDITO ICMS S/ ESTOQUE",
                              @"codigo_cfop": @2.949,
                              @"valor_icms": @1000,
                              @"ambiente": @2,
                              @"cliente": @{ @"cpf": @"000.000.000-00", @"nome_completo": @"Nome completo", @"endereco": @"Av. Brg. Faria Lima", @"complemento": @"Escritório", @"numero": @1000, @"bairro": @"Itaim Bibi", @"cidade": @"São Paulo", @"uf": @"SP", @"cep": @"00000-000", @"telefone": @"(00) 0000-0000", @"email": @"nome@email.com" } };

NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://webmaniabr.com/api/1/nfe/ajuste/"]
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