import 'package:dio/dio.dart';
import 'package:firstproject/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: "http://hesham060.mocklab.io/")
abstract class AppServiceClients {
  factory AppServiceClients(Dio dio, {String baseUrl}) = _AppServiceClient;

  // this implementation post request
  @POST("customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
