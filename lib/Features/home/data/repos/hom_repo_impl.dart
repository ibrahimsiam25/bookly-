import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> bookList;
      bookList = await homeLocalDataSource.fetchFeaturedBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(bookList);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      else{
       return left(ServerFailure(errmsg: e.toString())) ;
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> bookList;
      bookList = await homeLocalDataSource.fetchNewestBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchNewestdBooks();
      return right(bookList);
    } catch (e) {
         if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      else{
       return left(ServerFailure(errmsg: e.toString())) ;
      }
    }
  }
}
