import 'package:arc360menu/src/curd/dish_curd/dish_curd.dart';
import 'package:arc360menu/src/curd/menu_cued/menu_curd.dart';
import 'package:arc360menu/src/curd/moor_curd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'menu_body_tab.dart';

class MenuBody extends StatefulWidget {
  MenuDao menuDao;
  DishsDao dishsDao;
  var db = AppDatabase();

  MenuBody() {
    menuDao = MenuDao(db);
    dishsDao = DishsDao(db);
  }
  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 843, allowFontScaling: false);
    return Container(
      child: Container(
        child: StreamBuilder(
            stream: widget.menuDao.getAllIMenu(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Menu> menuList = snapshot.data;
                if (menuList.isNotEmpty) {
                  return MenuBodyTab(menuList: menuList);
                }
                return Container();
              }
               return CircularProgressIndicator();
            }),
      ),
    );
  }
}
