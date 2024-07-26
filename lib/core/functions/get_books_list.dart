  import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/domain/entities/book_entity.dart';

List<BookEntity> getBookList(data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }