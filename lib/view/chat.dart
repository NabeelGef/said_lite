import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constant/values.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  RxDouble keyboard = 0.0.obs;
  TextEditingController controllerMessage = TextEditingController();
  String message = "";
  List<Map<String, String>> messages = [
    {"message": "اهلا بك كيف أقدر أساعدك؟", "sender": "other"},
    {"message": "أواجه مشكلة في تحميل البيانات", "sender": "me"},
    {"message": "سنحاول إيجاد حل للمشكلة", "sender": "other"},
    {"message": "شكرا لكم", "sender": "me"},
  ];
  ItemScrollController _itemScrollController = ItemScrollController();
  void _scrollToIndex(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    keyboard.value = MediaQuery.of(context).viewInsets.bottom;
    Screen viewport = Screen(context);
    return Scaffold(
        backgroundColor: Coloring.primary,
        body: Center(
            child: SizedBox(
          width: viewport.getWidthscreen,
          height: viewport.getHeightscreen,
          child: Column(
            children: [
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20),
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[200],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Coloring.primary,
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 40, bottom: 20),
                          child: Image.asset("assets/images/chat2.png")),
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20),
                        child: Text("المحادثة المباشرة",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: Values.fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ]),
              ),
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      height: viewport.getHeightscreen / 1.3,
                      width: viewport.getWidthscreen,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                    ),
                    Container(
                      height: keyboard.value == 0.0
                          ? viewport.getHeightscreen / 2
                          : viewport.getHeightscreen / 3,
                      child: ScrollablePositionedList.builder(
                        itemScrollController: _itemScrollController,
                        initialScrollIndex: messages.length - 1,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return UnconstrainedBox(
                            alignment: messages[index]["sender"] == "other"
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Row(
                              textDirection: messages[index]["sender"] == "me"
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: viewport.getHeightscreen / 10,
                                  width: viewport.getWidthscreen / 5,
                                  child: Text(
                                      formatDate(
                                          DateTime.now(), [h, ":", n, am]),
                                      style: TextStyle(
                                          color: Coloring.primary,
                                          fontSize: 10,
                                          fontFamily: Values.fontFamily,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: viewport.getWidthscreen / 1.5,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top: 20, right: 10),
                                  decoration: BoxDecoration(
                                      color:
                                          messages[index]["sender"] == "other"
                                              ? Colors.blue[400]
                                              : Colors.blue[200],
                                      borderRadius: messages[index]["sender"] ==
                                              "other"
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25))
                                          : const BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                              bottomRight:
                                                  Radius.circular(25))),
                                  child: Text(messages[index]["message"]!,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: Coloring.primary,
                                          fontSize: 20,
                                          fontFamily: Values.fontFamily,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      width: viewport.getWidthscreen / 1.1,
                      bottom: viewport.getHeightscreen / 25,
                      left: viewport.getWidthscreen / 20,
                      child: Container(
                        alignment: Alignment.center,
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          controller: controllerMessage,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25)),
                              prefixIcon: Container(
                                width: viewport.getWidthscreen / 4,
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            if (controllerMessage
                                                .text.isNotEmpty) {
                                              messages.add({
                                                "message":
                                                    controllerMessage.text,
                                                "sender": "me"
                                              });
                                              _scrollToIndex(
                                                  messages.length - 1);

                                              controllerMessage.clear();
                                              setState(() {});
                                            }
                                          },
                                          child: Image.asset(
                                              "assets/images/send.png")),
                                      Icon(Icons.attach_file)
                                    ]),
                              ),
                              suffixIcon: Icon(Icons.sentiment_satisfied_alt)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
