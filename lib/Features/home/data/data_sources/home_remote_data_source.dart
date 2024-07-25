import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future <List<BookEntity>> fetchFeaturedBooks();
  Future <List<BookEntity>> fetchNewestdBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewestdBooks() {
    // TODO: implement fetchNewestdBooks
    throw UnimplementedError();
  }

}