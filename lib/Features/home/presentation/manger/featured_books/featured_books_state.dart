part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}
final class FeaturedBooksPagenagtionLoading extends FeaturedBooksState {}
final class FeaturedBooksPagenagtionFailure extends FeaturedBooksState {
   final String errmsg;

 
  const  FeaturedBooksPagenagtionFailure(this.errmsg);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errmsg;

  const FeaturedBooksFailure(this.errmsg);
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  const FeaturedBooksSuccess(this.books);
}
