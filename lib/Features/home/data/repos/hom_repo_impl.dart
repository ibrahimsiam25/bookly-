import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var bookLocalList = await homeLocalDataSource.fetchFeaturedBooks();
      if (bookLocalList.isNotEmpty) {
        return right(bookLocalList);
      }
      var bookRemoteList = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(bookRemoteList);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var bookLocalList = await homeLocalDataSource.fetchNewestBooks();
      if (bookLocalList.isNotEmpty) {
        return right(bookLocalList);
      }
      var bookRemoteList = await homeRemoteDataSource.fetchNewestdBooks();
      return right(bookRemoteList);
    } catch (e) {
      return left(Failure());
    }
  }
}
