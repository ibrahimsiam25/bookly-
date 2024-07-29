import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/no_param_use_case.dart';
import 'package:dartz/dartz.dart';

//in this case use_cases not important but may be need it in future
class FetchFeaturedBooksUseCase extends UseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    //if you need to cheak and return anther thing  , you can do this here
 final result = await homeRepo.fetchFeaturedBooks();

    result.fold(
      (failure) => print('Error fetching featured books: ${failure.errmsg}'),
      (books) {
        final length = books.length;
        print('Number of featured books: $length');
        return Right(books); // Return the books for further processing
      },
    );
    return await homeRepo.fetchFeaturedBooks();
  }
}
