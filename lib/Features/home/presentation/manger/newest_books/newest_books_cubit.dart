import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> featchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errmsg));
    }, (books) {
      emit(NewestBooksSucess(books));
    });
  }
}
