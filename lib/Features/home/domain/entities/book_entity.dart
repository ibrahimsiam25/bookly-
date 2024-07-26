import 'package:hive/hive.dart';
part 'book_entity.g.dart';
@HiveType(typeId: 0)
class BookEntity {
@HiveField(0)
  final String? image;
 @HiveField(1)
  final String title;
 @HiveField(2)
  final String? authorName;
 @HiveField(3)
  final num? rating;
 @HiveField(4)
  final num? avg;

  BookEntity(
      {required this.image,
      required this.title,
      required this.authorName,
      required this.rating,
      required this.avg
      });
}
