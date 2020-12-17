import 'package:arc360menu/src/curd/moor_curd.dart';
import 'package:flutter/cupertino.dart';
import 'menu_item.dart';

class MenuTabView extends StatefulWidget {
  List<Dish> dishList;
  MenuTabView({this.dishList});

  @override
  _MenuTabViewState createState() => _MenuTabViewState();
}

class _MenuTabViewState extends State<MenuTabView> {
  // List<dynamic> _dataModel;
  // int _menuItem = 0;
  // List<Widget> _dishWidgetsList = [];

  @override
  Widget build(BuildContext context) {
    // _dataModel = widget.catDataModel;
    // _menuItem = widget.menuItem;

    return ListView(
      children: [
        ...widget.dishList.map((e)=>
        MenuItem(
          dish: e,
        ),
        )
         
      ],
//      children: getSampleMenuItems(3)
//          .map((e) => Padding(
//                child: e,
//                padding: EdgeInsets.only(top: 5, bottom: 5),
//              ))
//          .toList(),
    );
  }

  // List<Widget> constructList(int _menuItem, List<dynamic> _dataModel){
  //   _dishWidgetsList = [];
  //   for(int i = 0; i < _dataModel.length; i++){
  //     if(_dataModel[i]['cat_id'] == _menuItem.toString()){
  //       _dishWidgetsList.add(
  //           MenuItem(
  //             _dataModel[i]['dish_name'],
  //             double.parse(_dataModel[i]['price1']),
  //             (int.parse(_dataModel[i]['is_veg']) == 0),
  //             _dataModel[i]['description'],
  //             i.toString(),
  //             isExpanded: false,
  //           )
  //       );
  //     }
  //   }
  //   return _dishWidgetsList;
  // }

//  List<MenuItem> getSampleMenuItems(int n) {
//    var rng = Random();
//    var menuItems = new List<MenuItem>(n);
//    for (var i = 0; i < n; i++) {
//      menuItems[i] = MenuItem(
//        "Thai Platter",
//        100.0 + rng.nextInt(200),
//        rng.nextInt(2) == 0,
//        "Sample Menu Item",
//        i.toString(),
//        isExpanded: false,
//      );
//    }
//    return menuItems;
//  }

}
