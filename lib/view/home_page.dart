import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../constant/colors.dart';
import '../constant/fabbar.dart';
import '../constant/values.dart';
import '../constant/viewport.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedpage = 3;
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    Values values = Get.find();
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.qr_code)),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 3, color: Colors.blue))),
          child: FABBottomAppBar(
            onTabSelected: (value) {
              setState(() {
                selectedpage = value;
                print("selectedpage = $selectedpage");
              });
            },
            items: [
              FABBottomAppBarItem(
                  iconData: Icon(Icons.storefront_sharp,
                      color:
                          selectedpage == 0 ? Coloring.primary : Colors.grey),
                  text: ""),
              FABBottomAppBarItem(
                  iconData: Icon(Icons.headset_mic,
                      color:
                          selectedpage == 1 ? Coloring.primary : Colors.grey),
                  text: ""),
              FABBottomAppBarItem(
                  iconData: Icon(Icons.equalizer,
                      color:
                          selectedpage == 2 ? Coloring.primary : Colors.grey),
                  text: ""),
              FABBottomAppBarItem(
                  iconData: Icon(Icons.home,
                      color:
                          selectedpage == 3 ? Coloring.primary : Colors.grey),
                  text: ""),
            ],
            backgroundColor: Colors.white,
            centerItemText: '',
            color: Colors.grey,
            notchedShape: const CircularNotchedRectangle(),
          ),
        ),
        appBar: selectedpage == 3
            ? PreferredSize(
                preferredSize:
                    Size(viewport.getWidthscreen, viewport.getHeightscreen / 8),
                child: GetBuilder<Values>(builder: (controller) {
                  return controller.namePage != "add_product"
                      ? AppBar(
                          elevation: 0,
                          toolbarHeight: viewport.getHeightscreen / 8,
                          actions: [
                            Column(
                              children: [
                                Container(
                                  height: viewport.getHeightscreen / 30,
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Text("ميني سوبر ماركت",
                                      style: TextStyle(
                                          color: Coloring.primary,
                                          fontSize: 15,
                                          fontFamily: Values.fontFamily,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  height: viewport.getHeightscreen / 30,
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Text("...كاشير احمد, مرحبا بك",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontFamily: Values.fontFamily,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  height: viewport.getHeightscreen / 30,
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    formatDate(DateTime.now(), [
                                      '  ',
                                      HH,
                                      ':',
                                      nn,
                                      am,
                                      ',',
                                      yyyy,
                                      '/',
                                      mm,
                                      '/',
                                      D,
                                    ]),
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily),
                                  ),
                                )
                              ],
                            )
                          ],
                          leading: Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                icon: Icon(
                                  Icons.reorder,
                                  color: Coloring.primary,
                                  size: 44, // Changing Drawer Icon Size
                                ),
                                onPressed: () {
                                  values.dialogDrawer(
                                      context, viewport.getWidthscreen / 1.2);
                                },
                                tooltip: MaterialLocalizations.of(context)
                                    .openAppDrawerTooltip,
                              );
                            },
                          ),
                          backgroundColor: Colors.white,
                          systemOverlayStyle: const SystemUiOverlayStyle(
                              statusBarColor: Colors.white),
                        )
                      : SizedBox();
                }))
            : null,
        body: GetBuilder<Values>(
          builder: (controller) {
            return controller.getPages().elementAt(selectedpage);
          },
        ));
  }
}
