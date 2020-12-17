
import 'package:arc360menu/src/screens/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
import 'package:imagebutton/imagebutton.dart';

import '../data_model.dart';

const CHECKOUT_HEADER_TEXT = 'Checkout';
const PAYMENT_METHOD_TEXT = 'Select Payment Method';
const double PAYMENT_METHOD_TEXT_SIZE = 38;
const double HEADER_FONT_SIZE = 30;
const double PAYMENT_METHOD_IMAGE_HEIGHT = 50;
const RECEIPT_BODY_COLOR = Colors.white;
const GRAND_TOTAL_TEXT = "Grand Total";
const double GRAND_TOTAL_FONT_SIZE = 25;
const double DIVIDER_THICKNESS = 2;
const RUPEE_SYMBOL = "₹";
const double RECEIPT_CONTAINER_PADDING_LEFT = 30;
const double RECEIPT_CONTAINER_PADDING_RIGHT = RECEIPT_CONTAINER_PADDING_LEFT;
const double RECEIPT_CONTAINER_PADDING_TOP = 20;
const double RECEIPT_CONTAINER_PADDING_BOTTOM = RECEIPT_CONTAINER_PADDING_TOP;
const String ITEM_TOTAL_STRING = 'Item Total';
const String TAXES_STRING = 'Taxes';
const String PROMO_CODE_LABEL = "Promo Code Applied : ";
const Color PROMO_CODE_FONT_COLOR = Colors.red;
const double INTER_CONTAINER_GAP = 20;
const double HEADER_HEIGHT = 120;

final logoPaths = [
  'assets/imgs/bhim.jpg',
  'assets/imgs/1.jpg',
  'assets/imgs/paytm.jpg',
  'assets/imgs/food_img.jpg'
];

class CheckoutWidget extends StatelessWidget {
  final double itemTotal, taxes;
  final String promoCode;
  final Order order;

  CheckoutWidget(this.itemTotal, this.taxes, this.promoCode, this.order);

  @override
  Widget build(BuildContext context) {
    var receiptBodyWidth = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
       appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 150.0),
              child: Text(
                CHECKOUT_HEADER_TEXT,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: HEADER_FONT_SIZE,
                    fontWeight: FontWeight.bold,
                  fontFamily: 'Metropolis',
                ),

                textAlign: TextAlign.center,
              )),
          backgroundColor: HEADER_COLOR,
          toolbarHeight: HEADER_HEIGHT,
        ),
        // backgroundColor: Color(0xFFECEFF1), // bluegrey[50]
        // backgroundColor: Color(0xFF673AB7),
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(INTER_CONTAINER_GAP + 40),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          width: receiptBodyWidth,

                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: RECEIPT_BODY_COLOR,
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    RECEIPT_CONTAINER_PADDING_LEFT,
                                    RECEIPT_CONTAINER_PADDING_TOP,
                                    RECEIPT_CONTAINER_PADDING_RIGHT,
                                    RECEIPT_CONTAINER_PADDING_BOTTOM),
                                child: Column(
                                    children: this
                                        .order
                                        .items
                                        .map((item) => Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(item.name +
                                            " x" +
                                            item.quantity.toString()),
                                        Text(
                                          RUPEE_SYMBOL +
                                              item.price.toString(),
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
                                            fontFamily: 'Metropolis',
                                          ),
                                        )
                                      ],
                                    ))
                                        .toList())),
                          )), //
                      SizedBox(height: INTER_CONTAINER_GAP), // for orders
                      Container(
                        width: receiptBodyWidth,

                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: RECEIPT_BODY_COLOR,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                RECEIPT_CONTAINER_PADDING_LEFT,
                                RECEIPT_CONTAINER_PADDING_TOP,
                                RECEIPT_CONTAINER_PADDING_RIGHT,
                                RECEIPT_CONTAINER_PADDING_BOTTOM),
                            child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: PROMO_CODE_LABEL,
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: this.promoCode,
                                            style: TextStyle(
                                                color: PROMO_CODE_FONT_COLOR,
                                              fontFamily: 'Metropolis',))
                                      ]),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: INTER_CONTAINER_GAP),
                      Container(
                        width: receiptBodyWidth,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: RECEIPT_BODY_COLOR,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                RECEIPT_CONTAINER_PADDING_LEFT,
                                RECEIPT_CONTAINER_PADDING_TOP,
                                RECEIPT_CONTAINER_PADDING_RIGHT,
                                RECEIPT_CONTAINER_PADDING_BOTTOM),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(ITEM_TOTAL_STRING),
                                    Text(
                                      RUPEE_SYMBOL + this.itemTotal.toString(),
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,
                                        fontFamily: 'Metropolis',
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(TAXES_STRING),
                                    Text(
                                      RUPEE_SYMBOL + this.taxes.toString(),
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,
                                        fontFamily: 'Metropolis',
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: INTER_CONTAINER_GAP),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
          Divider(
            thickness: DIVIDER_THICKNESS,
            height: 15,
            color: Colors.grey[800],
            indent: 100.0,
            endIndent: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70, top: 30),
            child: Container(
              width: receiptBodyWidth,

              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: RECEIPT_BODY_COLOR,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      RECEIPT_CONTAINER_PADDING_LEFT,
                      RECEIPT_CONTAINER_PADDING_TOP,
                      RECEIPT_CONTAINER_PADDING_RIGHT,
                      RECEIPT_CONTAINER_PADDING_BOTTOM),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        GRAND_TOTAL_TEXT,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: GRAND_TOTAL_FONT_SIZE ,
                          fontFamily: 'Metropolis',
                        ),
                      ),
                      Text(
                        RUPEE_SYMBOL + (this.itemTotal + this.taxes).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: GRAND_TOTAL_FONT_SIZE,
                          fontFamily: 'Metropolis',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 120, left: 30, right: 30),
            child: PaymentMethodWidget(),
          ),

        ]));
  }
}

class PaymentMethodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var paymentMethodImageHWidth = MediaQuery.of(context).size.width / 6;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          PAYMENT_METHOD_TEXT,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: PAYMENT_METHOD_TEXT_SIZE,fontFamily: 'Metropolis',),
        ),
        SizedBox(height: 60),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: logoPaths
                .map(
                  (path) => ImageButton(
                height: PAYMENT_METHOD_IMAGE_HEIGHT,
                width: paymentMethodImageHWidth,
                pressedImage: Image.asset(path),
                unpressedImage: Image.asset(path),
                children: [],
              ),
            )
                .toList())
      ],
    );
  }
}
