import 'package:dio/dio.dart';

abstract class Failure {
  final String errmsg;

  Failure({required this.errmsg});
}

class ServerFailure extends Failure{
  ServerFailure({required super.errmsg});
factory ServerFailure.fromDioError( DioException dioExcption){
    switch (dioExcption.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errmsg:'Connection timeout with ApiServer');

      case  DioExceptionType.sendTimeout:
        return ServerFailure(errmsg:'Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errmsg:'Receive timeout with ApiServer');

      case  DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExcption.response!.statusCode, dioExcption.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errmsg:'Request to ApiServer was canceld');

      case  DioExceptionType.unknown:
        if (dioExcption.message!.contains('SocketException')) {
          return ServerFailure(errmsg:'No Internet Connection');
        }
        return ServerFailure(errmsg:'Unexpected Error, Please try again!');
      default:
        return ServerFailure(errmsg:'Opps There was an Error, Please try again');
    }
}
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errmsg:response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errmsg:'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(errmsg:'Internal Server error, Please try later');
    } else {
      return ServerFailure(errmsg:'Opps There was an Error, Please try again');
    }
  }
}
