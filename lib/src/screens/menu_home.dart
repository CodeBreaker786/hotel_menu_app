 


import 'package:arc360menu/src/cache/data_model.dart';
import 'package:arc360menu/src/screens/menu_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
 

import 'menu_body.dart';





class MenuHome extends StatefulWidget{

  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome>{

  dynamic data;

  @override
  Widget build(BuildContext context) {
  ScreenUtil.init(context,height: 843,width: 411);
    buildDataObj();

    return Scaffold(
      body: FutureBuilder(
        future: buildDataObj(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else if (snapshot.hasError) {
            return Container();
          } else if (snapshot == null || snapshot.data == null) {
            return Container();
          } else if (snapshot.data != null) {

            return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [

                   Container(
                      height: MediaQuery.of(context).size.height * 0.93,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: MenuNavigation(),
                          ),
                          Expanded(
                            flex: 2,
                            child: MenuBody(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlatButton.icon(
                              onPressed: (){

                              },
                              icon: Icon(
                                Icons.wine_bar_rounded,
                                color: Colors.white,
                                size: 28,
                              ),

                              label: Text('Water', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                              minWidth: 150.0,
                              height: 45.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.white, width: 1.5),

                              ),





                            ),
                            FlatButton.icon(
                              onPressed: (){

                              },
                              icon: Icon(
                                Icons.room_service_rounded,
                                color: Colors.white,
                                size: 28,
                              ),

                              label: Text('Call', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                              minWidth: 150.0,
                              height: 45.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.white, width: 1.5),


                              ),

                            ),
                            FlatButton.icon(
                              onPressed: (){

                              },
                              icon: Icon(
                                Icons.receipt_long_rounded,
                                color: Colors.white,
                                size: 28,
                              ),

                              label: Text('Bill', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                              minWidth: 150.0,
                              height: 45.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.white, width: 1.5),

                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

}