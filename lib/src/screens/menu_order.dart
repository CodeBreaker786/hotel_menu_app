import 'package:arc360menu/src/curd/dish_curd/dish_curd.dart';
import 'package:arc360menu/src/curd/moor_curd.dart';
import 'package:arc360menu/src/curd/temporder/temporder_curd.dart';
import 'package:arc360menu/src/screens/menu_home.dart';
import 'package:flutter/material.dart';

bool widgetVisible = true;
//int _qty = 0;

class Order extends StatefulWidget {
  TemporderDao temporderDao;
  DishsDao dishsDao;
  var db = AppDatabase();
  Order() {
    temporderDao = TemporderDao(db);
    dishsDao = DishsDao(db);
  }
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: widget.temporderDao.getAllDishWithQuantity(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Temporder> temporterdata = snapshot.data;
              if (temporterdata.isNotEmpty) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ...temporterdata.map(
                      (e) => Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10.0),
                        height: 100,
                        child: Material(
                          color: Colors.white,
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(13.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.dishName,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[850],
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Metropolis',
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'INR ' + e.price.toString(),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[850],
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Metropolis',
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () async {
                                            if (e.quantity == 1) {
                                              widget.temporderDao
                                                  .deleteTemporder(e);
                                            } else {
                                              widget.temporderDao
                                                  .updateTemporder(e.copyWith(
                                                      quantity:
                                                          e.quantity - 1));
                                            }
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                          ),
                                        ),
                                        Text(
                                          e.quantity.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            await widget.temporderDao
                                                .updateTemporder(e.copyWith(
                                                    quantity: e.quantity + 1));
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.red[900],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
