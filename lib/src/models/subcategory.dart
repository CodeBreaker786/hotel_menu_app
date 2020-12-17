import 'package:moor/moor.dart';

class SubCategorys extends Table {
  IntColumn get id => integer()();
  TextColumn get sCatName => text().nullable()();
   TextColumn get catId => text().nullable()();

      @override
  Set<Column> get primaryKey => {id};
}
