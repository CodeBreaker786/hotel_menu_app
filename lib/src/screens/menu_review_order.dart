// TODO Implement this library.

// import 'dart:html';

import 'package:flutter/material.dart';
import 'menu_history.dart';
import 'menu_order.dart';

class MenuReviewOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 150,
            backgroundColor: Colors.grey[200],
            elevation: 0,
            bottom: TabBar(
              labelColor: Colors.red[900],
              unselectedLabelColor: Colors.grey[850],
              indicatorColor: Colors.red[900],
              tabs: [
                Tab(
                child: Text(
                  'Order',
                  style: TextStyle(fontSize: 15),
                ),
            ),

                Tab(
                  child: Text(
                    'History',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                // Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 30.0 ),

            child: Center(
              child: Text(' Review Order ',
                          style: TextStyle(fontSize: 30, color: Colors.grey[850],),
                      ),
            ),
            ),
          ),


          body: TabBarView(
            
            children: [
              Order(),
              History(),
              // Icon(Icons.directions_car),
              // Icon(Icons.directions_transit),
              // Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
