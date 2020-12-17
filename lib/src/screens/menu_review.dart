

import 'package:flutter/material.dart';

import 'menu_navigation.dart';
import 'menu_review_order_page.dart';

class MenuReview extends StatefulWidget{

  @override
  _MenuReviewState createState() => _MenuReviewState();
}

class _MenuReviewState extends State<MenuReview>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: MenuNavigation(),
              ),
              Expanded(
                flex: 2,
                child: MenuReviewOrderPage(),
              )
            ],
          )
      ),
    );
  }

}