import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> featchFeaturedBooks({int pageNumber =0}) async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call(pageNumber );
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errmsg));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
