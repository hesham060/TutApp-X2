


// this is implement it to call appServiceClient 

import 'package:firstproject/data/network/app_api.dart';
import 'package:firstproject/data/network/requests.dart';
import 'package:firstproject/data/response/responses.dart';
abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoreDataSourceImpl implements RemoteDataSource {
 final  AppServiceClients _appServiceClient;
  RemoreDataSourceImpl(this._appServiceClient);

  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }
}
