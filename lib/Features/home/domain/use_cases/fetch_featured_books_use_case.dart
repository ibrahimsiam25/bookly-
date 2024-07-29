import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';

//in this case use_cases not important but may be need it in future
class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([ int pageNumber =0]) async {
    //if you need to cheak and return anther thing  , you can do this here
    return await homeRepo.fetchFeaturedBooks(
      pageNumber:  pageNumber
    );
  }
}
