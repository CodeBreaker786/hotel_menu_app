import 'package:arc360menu/src/cache/in_memory_cache.dart';
import 'package:arc360menu/src/values/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feedback.dart';

class MenuNavigation extends StatefulWidget {
  @override
  _MenuNavigationState createState() => _MenuNavigationState();
}

class _MenuNavigationState extends State<MenuNavigation> {
  
  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
                color: Colors.red,
                child: Center(
                    child: Text("Enter Promo Code",
                        style: TextStyle(color: Colors.white)))),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Submit'),
                onPressed: () {},
              )
            ],
          );
        });
  }

  Map<String, dynamic> _menuData, _menuSubData;

  List<Widget> _menuWidgets = [];
  List<Widget> _subMenuWidgets = [];
  
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,height: 843,width: 411);
    _menuData = InMemoryCache().get(AppKeys.DATA_MENU);
    _menuSubData = InMemoryCache().get(AppKeys.DATA_SUBMENU);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              //margin: EdgeInsets.all(ScreenUtil().setWidth(15)),
              //padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setWidth(23),
                        bottom: ScreenUtil().setWidth(1)),
                    //padding: EdgeInsets.only(top: ScreenUtil().setWidth(45), bottom: ScreenUtil().setWidth(5)),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            ScreenUtil().setSp(30, allowFontScalingSelf: true),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setWidth(7),
                        bottom: ScreenUtil().setWidth(
                            1)), //Space between Menu title and promo code
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.3),
                      //     spreadRadius: 5,
                      //     blurRadius: 7,
                      //     offset: Offset(0, 6), // changes position of shadow
                      //   ),
                      // ],
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        createAlertDialog(context);
                      },
                      // child: const Text('Bottom Button!', style: TextStyle(fontSize: 20)),
                      child: Text('Promo code'),
                      color: Colors.white,
                      textColor: Colors.black,
                      elevation: 5,
                    ),

//                     child: TextField(
// //                          controller: _numberController,
//                       textAlign: TextAlign.left,
//                       textAlignVertical: TextAlignVertical.center,
//                       keyboardType: TextInputType.number,
//                       style: TextStyle(
// //                      fontFamily: AppFonts.PRIMARY_FONT,
// //                      fontStyle: FontStyle.italic,
// //                      color: AppColors.primaryTextDark,
//                         fontSize: ScreenUtil()
//                             .setSp(16, allowFontScalingSelf: true),
//                       ),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         focusColor: Colors.white,
//                         contentPadding: EdgeInsets.only(
//                             left: ScreenUtil().setWidth(10)),
//                         hintText: 'PROMO Code',
//                         hintStyle: TextStyle(
//                           fontStyle: FontStyle.italic,
// //                          fontFamily: AppFonts.PRIMARY_FONT
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.white, width: 5.0),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.white, width: 5.0),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: ScreenUtil()
                      .setWidth(5)), // spacing from start to dish names
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < _menuData['data'].length; i++)
                      Theme(
                        data: Theme.of(context).copyWith(
                          accentColor: Colors.white,
                        ),
                        child: ExpansionTile(
                          backgroundColor: Colors.red[900],
                          trailing: SizedBox.shrink(),

                          title: Text(
                            _menuData['data'][i]['cat_name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(
                                12,
                                allowFontScalingSelf: true,
                              ),
                              //color: (isExpand!=true)?Colors.black:Colors.white,
                            ),
                          ),
                          children: _createSubItems(i),
                          // onExpansionChanged: (value){
                          //   setState(() {
                          //     isExpand=value;
                          //   });
                          //},
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: ScreenUtil().setWidth(40),
            //margin: EdgeInsets.all(ScreenUtil().setWidth(14)),
            child: RaisedButton(
              onPressed: () {
                // InMemoryCache().set('abcd', 45);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(body: FeedbackWidget()))
                    // CheckoutWidget(500, 100, "promocode",
                    //     Order("1", [Item("goan curry", 123, 2)]))),
                    // Currently only one sample item passed, later make a function and pass that
                    );
              },
              child: Text(
                'Check Out',
                style: TextStyle(
                    fontSize:
                       ScreenUtil().setSp(16, allowFontScalingSelf: true)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _createSubItems(int i) {
    _subMenuWidgets = [];
    for (int j = 0; j < _menuSubData['data'].length; j++) {
      if (_menuData['data'][i]['cat_id'] == _menuSubData['data'][j]['cat_id']) {
        _subMenuWidgets.add(Container(
          margin: EdgeInsets.all(ScreenUtil().setWidth(8)),
          child: Row(
            children: [
              Icon(
                Icons.remove,
                size: ScreenUtil().setWidth(15),
              ),
              Text(
                _menuSubData['data'][j]['scat_name'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(11, allowFontScalingSelf: true),
                ),
              )
            ],
          ),
        ));
      }
    }
    return _subMenuWidgets;
  }
}
