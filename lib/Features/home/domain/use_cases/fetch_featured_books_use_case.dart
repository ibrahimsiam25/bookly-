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
  Future<Either<Failure,List<BookEntity>>> call() async {
  return await homeRepo.fetchFeaturedBooks();
  }
 
}
