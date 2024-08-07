part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksSucess extends NewestBooksState {
  final List<BookEntity> books;

 const NewestBooksSucess(this.books);
}
final class NewestBooksFailure extends NewestBooksState {
  final String errmsg;

  const NewestBooksFailure(this.errmsg);
}
