import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekab_app/controller/bottom_controller.dart';

import 'fillter_screen.dart';

void main() {
  runApp(GetMaterialApp(
    home: BottomNavigationExample(),
  ));
}

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {

  int selectTabIndex = 2;
  List _pages = [

    Center(
      child: Text("Filters"),
    ),
    Center(
      child: Text("Lips"),
    ),
    Container(
        child:Image.asset(
      "assets/ic_image.png",
    )),
    Center(
      child: Text("Eye"),
    ),
    Center(
      child: Text("Body tuner"),
    ),
    Center(
      child: Text("Hair"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      selectTabIndex= index;
      if(selectTabIndex==0){

        Get.to(FillterScreen());

      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(30.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
      ),
      body:GetBuilder<BottomConntroller>( // specify type as Controller
        init: BottomConntroller(), // intialize with the Controller
        builder: (bottomControllerValue) => Column(
          children: [
            Container(height: 20,),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Icon(Icons.arrow_back),
                  ),
                  Icon(
                    Icons.reset_tv,
                  ),
                  Icon(Icons.forward_5),

                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(

                              colors: [
                                const Color(0xFFFC4E6B),
                                const Color(0xFFD360B0),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12,bottom: 5,top: 5),
                          child: Text("Save"),
                        )
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: _pages[selectTabIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.red),
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_filter.png',
              width: 18,
              height: 18,
            ),
            label: "Filters",
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_lip.png',
                width: 18,
                height: 18,
              ),
              label: "Lips"),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_face.png',
                width: 18,
                height: 18,
              ),
              label: "Face"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_eye.png",
                width: 18,
                height: 18,
              ),
              label: "Eye"),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/weight_loss.png',
                width: 17,
                height: 17,
              ),
              label: "Body Tunner"),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_hair.png',
                width: 18,
                height: 18,
              ),
              label: "Hair"),
        ],
      ),
    );
  }
}
