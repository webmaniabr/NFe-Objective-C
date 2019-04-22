#import <Foundation/Foundation.h>

NSDictionary *headers = @{ @"Cache-Control": @"no-cache",
                           @"Content-Type": @"application/json",
                           @"X-Consumer-Key": @"SEU_CONSUMER_KEY",
                           @"X-Consumer-Secret": @"SEU_CONSUMER_SECRET",
                           @"X-Access-Token": @"SEU_ACCESS_TOKEN",
                           @"X-Access-Token-Secret": @"SEU_ACCESS_TOKEN_SECRET"};
                           
NSDictionary *parameters = @{ @"ID": @1137,
                              @"url_notificacao": @"http://meudominio.com/retorno.php",
                              @"operacao": @1,
                              @"natureza_operacao": @"Venda de produção do estabelecimento",
                              @"modelo": @1,
                              @"finalidade": @1,
                              @"ambiente": @2,
                              @"cliente": @{ @"cpf": @"000.000.000-00", @"nome_completo": @"Nome do Cliente", @"endereco": @"Av. Brg. Faria Lima", @"complemento": @"Escritório", @"numero": @1000, @"bairro": @"Itaim Bibi", @"cidade": @"São Paulo", @"uf": @"SP", @"cep": @"00000-000", @"telefone": @"(00) 0000-0000", @"email": @"nome@email.com" },
                              @"produtos": @[ @{ @"nome": @"Nome do produto", @"codigo": @"nome-do-produto", @"ncm": @"6109.10.00", @"cest": @"28.038.00", @"quantidade": @3, @"unidade": @"UN", @"peso": @"0.800", @"origem": @"", @"subtotal": @"44.90", @"total": @"134.70", @"classe_imposto": @"REF2892", @"veiculos_novos": @{ @"tipo_operacao": @"1", @"chassi": @"00000000000000000", @"cor": @"A1", @"cor_descricao": @"Descrição da Cor", @"cv": @"100", @"cilindrada": @"1000", @"peso_liquido": @"2.5000", @"peso_bruto": @"2.5000", @"serie": @"00001", @"tipo_combustivel": @"16", @"numero_motor": @"00001", @"cmt": @"2.000", @"dist": @"150", @"ano_modelo": @"2019", @"ano_fabricacao": @"2018", @"tipo_pintura": @"Tipo de Pintura", @"tipo_veiculo": @"06", @"especie_veiculo": @"1", @"vin": @"N", @"condicao_veiculo": @"1", @"marca_modelo": @"00001", @"cor_denatran": @"04", @"lotacao": @"5", @"restricao": @"0" } } ],
                              @"pedido": @{ @"pagamento": @"", @"presenca": @2, @"modalidade_frete": @"", @"frete": @"12.56", @"desconto": @"10.00", @"total": @"174.60" } };

NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://webmaniabr.com/api/1/nfe/emissao/"]
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