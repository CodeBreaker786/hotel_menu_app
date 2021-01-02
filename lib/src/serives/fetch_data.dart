import 'package:arc360menu/src/constants.dart';
import 'package:arc360menu/src/curd/dish_curd/dish_curd.dart';
import 'package:arc360menu/src/curd/image_curd/photos_curd.dart';
import 'package:arc360menu/src/curd/menu_cued/menu_curd.dart';
import 'package:arc360menu/src/curd/moor_curd.dart';
import 'package:arc360menu/src/curd/temporder/temporder_curd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_downloader/image_downloader.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

fectchDataFromfirebase() async {
  MenuDao menuDao;
  TemporderDao temporderDao;
  DishsDao dishsDao;
  PhotosDao photosDao;
  var db = AppDatabase();

  menuDao = MenuDao(db);
  temporderDao = TemporderDao(db);
  dishsDao = DishsDao(db);
  photosDao = PhotosDao(db);

  QuerySnapshot menuList =
      await firebaseFirestore.collection(MENU_COLLECTIONS).get();
  QuerySnapshot dishesList =
      await firebaseFirestore.collection(DISHES_COLLECTIONS).get();
  QuerySnapshot images =
      await firebaseFirestore.collection(IMAGE_COLLECTIONS).get();
  await menuDao.deleteAllMenu();
  await dishsDao.deleteAllDish();
  await photosDao.deleteAllPhotos();
  await temporderDao.deleteAllTemporder();
  List<String> imagesURL = [];
  images.docs.forEach((doc) {
    
 print(doc.data());
    photosDao.insertPhoto(Photo.fromJson(doc.data()));
   
  });

  print(imagesURL.toString());

  menuList.docs.forEach((doc) {
    menuDao.insertMenu(Menu(
      id: doc['cat_id'],
      catName: doc['cat_name'],
      hasSc: doc['has_sc'],
    ));
  });
  dishesList.docs.forEach((doc) {
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
  return null;
}
