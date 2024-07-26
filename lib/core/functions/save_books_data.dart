import 'package:hive_flutter/hive_flutter.dart';

import '../../Features/home/domain/entities/book_entity.dart';

void saveData(List<BookEntity> books,String boxName) {
     var box = Hive.box(boxName);
    box.addAll(books);
  }
