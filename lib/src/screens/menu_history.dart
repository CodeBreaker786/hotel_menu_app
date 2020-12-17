import 'package:flutter/material.dart';

bool widgetVisible = true ;
int _qty = 0;

class History extends StatefulWidget {
  @override
  _History createState() => _History();
}

class _History extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Container(
            height: 100,
            child: Row(
                children: [
                  Column(
                      children:[
                        Text('DishName'),
                        Text('Quantity : full'),
                      ]
                  ),
                  Column(
                    children:[ Text('Rs 123'),]
                  )
                ]
            )

        )
    );
  }
}
