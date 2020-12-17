import 'package:arc360menu/src/curd/dish_curd/dish_curd.dart';
import 'package:arc360menu/src/curd/menu_cued/menu_curd.dart';
import 'package:arc360menu/src/curd/moor_curd.dart';
import 'package:arc360menu/src/curd/temporder/temporder_curd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Firestore firestoreMenu = Firestore.instance;
Firestore firestoreDishes = Firestore.instance;
fectchDataFromfirebase() async {
  MenuDao menuDao;
  TemporderDao temporderDao;
  DishsDao dishsDao;
  var db = AppDatabase();

  menuDao = MenuDao(db);
  temporderDao = TemporderDao(db);
  dishsDao = DishsDao(db);
  QuerySnapshot menuList = await firestoreMenu
      .collection('menu')
      .getDocuments(source: Source.serverAndCache);
  QuerySnapshot dishesList = await firestoreDishes
      .collection('dishes')
      .getDocuments(source: Source.serverAndCache);
  await menuDao.deleteAllMenu();
  await dishsDao.deleteAllDish();
  await temporderDao.deleteAllTemporder();
  menuList.documents.forEach((doc) {
    menuDao.insertMenu(Menu(
      id: doc['cat_id'],
      catName: doc['cat_name'],
      hasSc: doc['has_sc'],
    ));
  });
  dishesList.documents.forEach((doc) {
    dishsDao.insertDish(Dish(
      catId: doc['cat_id'],
      id: doc['dish_id'],
      dishName: doc['dish_name'],
      discription: doc['discription'],
      image: doc['image'],
      price1: doc['price1'],
      price2: doc['price2'],
      portions: doc['portions'],
      quantity: 0,
      sCatId: doc['scat_id'],
      isVeg: doc['is_veg'],
    ));
  });
}
