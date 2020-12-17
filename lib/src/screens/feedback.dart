
import 'package:arc360menu/src/screens/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 

import '../data_model.dart';
import 'checkout_page.dart';

const double INTER_BUTTON_WIDTH = 30;
const double ROUNDED_CORNER_RADIUS = 10;
const double FORM_ELEMENT_HEIGHT = 30;
const double HEADER_FONT_SIZE = 22;
const FEEDBACK_HEADER_TEXT =
'''Tell us how your experience was\nwhile we process your order''';
enum Rating { good, average, very_good }

const Color INTERNAL_BOX_COLOR = Color(0xFFf9f9f9);
const Color OUTER_COLOR = Color(0xFFededed);
const double INTER_LABEL_WIDTH = 20;

class FeedbackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double inputBoxWidth = MediaQuery.of(context).size.width * 0.5;
    return SingleChildScrollView(
      child: Column(
        children: [
          RedHeader(
              child: Center(
                  child: Text(
                    FEEDBACK_HEADER_TEXT,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: HEADER_FONT_SIZE,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))),
          Container(
            color: OUTER_COLOR,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ROUNDED_CORNER_RADIUS)),
                      color: INTERNAL_BOX_COLOR,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text("First Name   ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Center(child: InputTextBox(width: inputBoxWidth)),
                          ]),
                          SizedBox(
                            height: INTER_LABEL_WIDTH,
                          ),
                          Row(children: [
                            Text("Last Name   ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            InputTextBox(width: inputBoxWidth)
                          ]),
                          SizedBox(
                            height: INTER_LABEL_WIDTH,
                          ),
                          Row(children: [
                            Text("Phone No.    ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            InputTextBox(width: inputBoxWidth),
                          ]),
                          SizedBox(
                            height: INTER_LABEL_WIDTH,
                          ),
                          Text(
                            "Additional Feedback",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 7),
                          InputTextBox(maxlines: 4),
                          SizedBox(height: INTER_LABEL_WIDTH),
                          Text("How would you rate our food",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          FeedbackRating(),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CheckoutWidget(500, 100, "promocode",
                              Order("1", [Item("goan curry", 123, 2)]))));
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: BorderSide(color: Colors.black)),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: INTER_BUTTON_WIDTH),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CheckoutWidget(500, 100, "promocode",
                                  Order("1", [Item("goan curry", 123, 2)]))));
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: BorderSide(color: Colors.black)),
                        child: Text(
                          "Skip",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputTextBox extends StatelessWidget {
  final double width;
  final int maxlines;

  InputTextBox({this.width, this.maxlines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(),
            filled: true,
            focusColor: Colors.white,
            fillColor: Colors.white,
            hoverColor: Colors.white,
          ),
          keyboardType: this.maxlines > 1 ? TextInputType.multiline : null,
          maxLines: this.maxlines,
        ));
  }
}

// radio Buttons
class FeedbackRating extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FeedbackRatingState();
  }
}

class FeedbackRatingState extends State<FeedbackRating> {
  Rating feedbackRating = Rating.very_good;

  @override
  Widget build(BuildContext context) {
    Function setFeedbackRating = (rating) => setState(() {
      feedbackRating = rating;
    });
    return Column(
      children: [
        RadioListTile(
          value: Rating.good,
          groupValue: feedbackRating,
          onChanged: setFeedbackRating,
          title: Text("Good"),
        ),
        RadioListTile(
          value: Rating.very_good,
          groupValue: feedbackRating,
          onChanged: setFeedbackRating,
          title: Text("Very Good"),
        ),
        RadioListTile(
          value: Rating.average,
          groupValue: feedbackRating,
          onChanged: setFeedbackRating,
          title: Text("Average"),
        ),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
