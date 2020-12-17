 

import 'package:arc360menu/src/models/subcategory.dart';
import 'package:moor/moor.dart';

import '../moor_curd.dart';

part 'sub_category_curd.g.dart';

@UseDao(
  tables: [SubCategorys],
)
class  SubCategoryDao extends DatabaseAccessor<AppDatabase> with _$SubCategoryDaoMixin {
  final AppDatabase db;

  SubCategoryDao(this.db) : super(db);
  Future updatesubCategory(SubCategory subCategory) => update(subCategorys).replace(subCategory);
  Future insertsubCategory(SubCategory subCategory) => into(subCategorys).insert(subCategory);
  Future deletesubCategory(SubCategory subCategory) => delete(subCategorys).delete(subCategory);
  Stream<List<SubCategory>> getAllIsubCategory() {
    return (select(db.subCategorys).watch());
  }
}