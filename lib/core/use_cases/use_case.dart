import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<DataType,Param>{
Future <Either<Failure,DataType>>call(Param param);
}