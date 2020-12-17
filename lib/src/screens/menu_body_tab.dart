import 'package:arc360menu/src/curd/dish_curd/dish_curd.dart';
import 'package:arc360menu/src/curd/moor_curd.dart';
import 'package:arc360menu/src/curd/temporder/temporder_curd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'menu_item.dart';
import 'menu_review.dart';

class MenuBodyTab extends StatefulWidget {

  List<Menu> menuList;
  DishsDao dishsDao;
  
  var db = AppDatabase();

  MenuBodyTab({this.menuList}) {
    dishsDao = DishsDao(db);
   
  }

  @override
  _MenuBodyTabState createState() => _MenuBodyTabState();
}

class _MenuBodyTabState extends State<MenuBodyTab>
    with TickerProviderStateMixin {
  TabController _controllerTab;
  List<Dish> dishList = List<Dish>();

  @override
  void initState() {

    _controllerTab =
         TabController(length: widget.menuList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: EdgeInsets.only(top: ScreenUtil().setWidth(3)),
        padding: EdgeInsets.only(top: 45.0),
        decoration:
            BoxDecoration(color: Colors.grey[200]), //Right Menu top space bar
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  //color: Colors.blueAccent,
                  ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.grey[200],
                ),
                isScrollable: true,
                controller: _controllerTab,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily:
                      'Metropolis', //Selected top menu page                  // fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
                  fontSize: 15,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  // fontSize: ScreenUtil().setSp(13, allowFontScalingSelf: true),
                  fontSize: 10,
                ),
                tabs: [
                  ...widget.menuList.map((e) {
                    return Tab(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          e.catName,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ],
                labelColor: Colors.grey[850],
                unselectedLabelColor: Colors.grey[600],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(controller: _controllerTab, children: <Widget>[
                ...widget.menuList.map(
                  (e) => StreamBuilder(
                      stream: widget.dishsDao.getAllDishByCatId(catId: e.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          dishList = snapshot.data;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                bottom: ScreenUtil()
                                    .setWidth(1), //right menu bottom spacing
                                top: ScreenUtil()
                                    .setWidth(8)), //right menu top spacing
                            decoration: BoxDecoration(
                              color:
                                  Colors.grey[200], //right menu background area
                              //borderRadius: BorderRadius.all(Radius.circular(10.0)),  //right menu background area
                            ),
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView(
                                children: [
                                  ...dishList.map(
                                    (e) => MenuItem(
                                      dish: e,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                )
              ]),
            ),
            Container(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () async {

                  //   List<Dish> dishes =
                  //       await widget.dishsDao.getAllDishWithQuantity();
                  //  dishes.forEach((e)async {
                  //     await widget.temporderDao.insertTemporder(Temporder(dishName: e.dishName,price: e.price1,quantity: e.quantity,dishId: e.id));
                  //   });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuReview(),
                    ),
                  );
                },
                padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 113),
                splashColor: Colors.redAccent[700],
                child: Text('PLACE ORDER',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Metropolis',
                    )), //Bottom Order Now Button
                color: Colors.red[900],
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14),
                      topLeft: Radius.circular(14)),
                ),
                elevation: 5,
              ),
            )),
          ],
        ));
  }
}
