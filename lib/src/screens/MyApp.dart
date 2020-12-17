
import 'package:arc360menu/src/screens/menu_home.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';

import 'menu_body.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 843, allowFontScaling: false);
    return MaterialApp(
      title: 'Carousel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

 

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future getData() async {
  //   var url = 'https://menuapp-demo.000webhostapp.com/get.php';
  //   http.Response response = await http.get(url);
  //   //print(response.body);
  //   var data = jsonDecode(response.body);
  //   for (int i = 0; i < data.length; i++) {
  //     print(data[i]['image']);
  //     imgList.add(data[i]['image']);
  //   }
  // }

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Scaffold(
              body: Stack(children: <Widget>[
                Swiper(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      'https://www.itl.cat/pngfile/big/43-430987_cute-profile-images-pic-for-whatsapp-for-boys.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                  loop: true,
                  autoplay: true,
                  autoplayDelay: 2000,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_upward),
                        iconSize: 50,
                        color: Colors.redAccent,
                      )),
                ),
              ])),
        MenuHome(),
       //   MenuBody(),
        ]);

  }
}


