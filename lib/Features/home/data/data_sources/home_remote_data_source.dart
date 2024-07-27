import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/save_books_data.dart';
import 'package:bookly/core/utils/api_service.dart';

import '../../../../core/functions/get_books_list.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestdBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=sport');
    List<BookEntity> books = getBookList(data);
    saveData(books,kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestdBooks()async {
       var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=programming');
    List<BookEntity> books = getBookList(data);
    saveData(books,kNewestBox);
    return books;
  }

  

}
