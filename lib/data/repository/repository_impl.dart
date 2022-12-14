// this file built from Repository, network check internet, Failure...
import 'package:firstproject/data/data_source/remote_data_source.dart';
import 'package:firstproject/data/mappers/mappers.dart';
import 'package:firstproject/data/network/error_handler.dart';
import 'package:firstproject/data/network/network_info.dart';
import 'package:firstproject/domain/models/models.dart';
import 'package:firstproject/data/network/requests.dart';
import 'package:firstproject/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firstproject/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  // RepositoryImpl is comming from repository which define right or left
  final RemoteDataSource _remoreDataSource; // processed to login request
  final NetwokInfo _netwokInfo; // this is resposable for checking connection
  RepositoryImpl(this._remoreDataSource, this._netwokInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _netwokInfo.isConnected) {
      // its connected , so its safe to call from api

      try {
        final response = await _remoreDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.success) {
          // sucess
          // return either right
          // return data
          return right(response.toDomain());
        } else {
          // failure --  return  business error coming from api
          // return either left
          return left(
            Failure(ApiInternalStatus.failure,
                response.message ?? ResponseMessage.DEFAULT),
          );
        }
      } catch (error) {
        
        return left(ErrorHandler.handler(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return left(
        Failure(Responsecode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION),
      );
    }
  }
}
