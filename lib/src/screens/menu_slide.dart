import 'dart:async';


import 'package:arc360menu/src/animations/slide_bottom_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
import 'package:ink_page_indicator/ink_page_indicator.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'menu_home.dart';


class MenuSlider extends StatefulWidget {
  @override
  _MenuSlider createState() => _MenuSlider();
}

class _MenuSlider extends State<MenuSlider> {
  final List<String> imgList = [
    'assets/imgs/1.jpeg',
    'assets/imgs/2.jpeg',
    'assets/imgs/3.jpeg',
  ];

  int _current = 0;

  bool _nextBt = false;
  bool _skipBt = true;

  PageIndicatorController controller;
  int _currentPage = 0;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    print(imgList);
    // getData();

    print(imgList);

    controller = PageIndicatorController(initialPage: 0);

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imgList.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Future getData() async{
  //   var url = 'https://menuapp-demo.000webhostapp.com/get.php';
  //   http.Response response = await http.get(url);
  //   // print(response.body);
  //   var data = jsonDecode(response.body);
  //   for (int i = 0; i < data.length; i++) {
  //     print(data[i]['image']);
  //     imgList.add(data[i]['image']);
  //   }
  //   // return imgList;
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 843, allowFontScaling: false);
    return pageViewContainer();
  }

  Widget pageViewContainer() {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: <Widget>[
                PageView(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  children: <Widget>[
                    Container(
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  imgList[0],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height,
                                )),
                            Positioned(
                                top: MediaQuery.of(context).size.height * 0.1,
                                left: MediaQuery.of(context).size.width * 0.5 -
                                    ScreenUtil().setWidth(50),
                                right: 0,
                                child: SizedBox(
                                  height: ScreenUtil().setWidth(40),
                                  width: ScreenUtil().setWidth(100),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Container(
                                      child: Text(
                                        'ORDER',
                                        style: TextStyle(
                                          fontSize: ScreenUtil()
                                              .setSp(18, allowFontScalingSelf: true),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        )),
                    Container(
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  imgList[1],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height,
                                )),
                            Positioned(
                                top: MediaQuery.of(context).size.height * 0.1,
                                left: MediaQuery.of(context).size.width * 0.5 -
                                    ScreenUtil().setWidth(50),
//                  right: 0,
                                child: SizedBox(
                                  height: ScreenUtil().setWidth(40),
                                  width: ScreenUtil().setWidth(100),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Container(
                                      child: Text(
                                        'ORDER',
                                        style: TextStyle(
                                          fontSize: ScreenUtil()
                                              .setSp(18, allowFontScalingSelf: true),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        )
                    ),
                    Container(
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  imgList[1],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height,
                                )),
                            Positioned(
                                top: MediaQuery.of(context).size.height * 0.1,
                                left: MediaQuery.of(context).size.width * 0.5 -
                                    ScreenUtil().setWidth(50),
//                  right: 0,
                                child: SizedBox(
                                  height: ScreenUtil().setWidth(40),
                                  width: ScreenUtil().setWidth(100),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Container(
                                      child: Text(
                                        'ORDER',
                                        style: TextStyle(
                                          fontSize: ScreenUtil()
                                              .setSp(18, allowFontScalingSelf: true),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        )
                    ),
                  ],
                ),

                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          SlideBottomPageTransition(page: MenuHome()),
                        );
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Icon(
                                Icons.file_upload,
                                size: 30,
                                color: Colors.deepOrangeAccent,
                              ),
                              Text(
                                'ORDER',
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(22, allowFontScalingSelf: true),
                                    color: Colors.white),
                              )
                            ],
                          )),
                    )),
              ],
            )));
  }
}