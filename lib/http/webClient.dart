import 'package:bytebonk/http/interceptors/loggingInterceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client =
InterceptedClient.build(interceptors: [LoggingInterceptor()]);
final String baseURL = 'http://192.168.1.2:8080/transactions';
