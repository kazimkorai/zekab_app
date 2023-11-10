import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';
import 'package:get/get.dart';
import 'package:zekab_app/controller/bottom_controller.dart';

import 'controller/filter_controller.dart';
import 'main.dart';

class FillterScreen extends StatefulWidget {
  const FillterScreen({Key? key}) : super(key: key);

  @override
  _FillterScreen createState() => _FillterScreen();
}

class _FillterScreen extends State {
  var filterController = Get.put(FilterController());
  int selectTabIndex = 1;
  List _pagesk = [
    Container(
        child: Image.asset(
      "assets/ic_image.png",
    )),
    Container(
        height: 400,
        child: Image.asset(
          "assets/ic_image.png",
          fit: BoxFit.fitHeight,
          height: 400,
        )),
    Container(
        height: 400,
        child: Image.asset(
          "assets/ic_image.png",
          fit: BoxFit.fitHeight,
          height: 400,
        )),
    Container(
        height: 400,

        child: Image.asset(
      "assets/ic_image.png",
          fit: BoxFit.fitHeight,
    )),

    Center(
      child: Text("Body tuner"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      selectTabIndex = index;
      if (selectTabIndex == 0) {
        Get.off(BottomNavigationExample());
      }
    });
  }

  double _currentSliderValue = 100;

  void changeSeekBar() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: InkWell(
                    onTap: () {
                      Get.off(BottomNavigationExample());
                    },
                    child: Icon(Icons.arrow_back)),
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
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 5, top: 5),
                      child: Text("Save"),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _pagesk[selectTabIndex],
        selectTabIndex == 2
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        Color(0xFFEBBEC5),
                        Color(0xFFF1D3D8),
                        Color(0xFFFBF5F6),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 4,
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        filterController.setLeftRightCheck(1);
                                      },
                                      child: Text("   Left",
                                          style: TextStyle(
                                              color: filterController
                                                          .isLeftRightCheck ==
                                                      1
                                                  ? Colors.red
                                                  : Colors.black)),
                                    ),
                                    VerticalDivider(
                                      thickness: 1,
                                      color: Color(0xFFC1C1C1),
                                      width: 2,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        filterController.setLeftRightCheck(2);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Overall",
                                            style: TextStyle(
                                                color: filterController
                                                            .isLeftRightCheck ==
                                                        2
                                                    ? Colors.red
                                                    : Colors.black)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 2, bottom: 2),
                                      child: VerticalDivider(
                                        thickness: 1,
                                        color: Color(0xFFC1C1C1),
                                        width: 2,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        filterController.setLeftRightCheck(3);
                                      },
                                      child: Text("Right   ",
                                          style: TextStyle(
                                              color: filterController
                                                          .isLeftRightCheck ==
                                                      3
                                                  ? Colors.red
                                                  : Colors.black)),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 4),
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 7,
                            trackShape: CustomTrackShape(),
                          ),
                          child: Slider(
                            value: _currentSliderValue,
                            max: 100,
                            activeColor: Color(0xFFFF677D),
                            inactiveColor: Colors.black12,
                            divisions: 100,
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
            decoration:selectTabIndex==3? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  Color(0xFFEBBEC5),
                  Color(0xFFF1D3D8),
                  Color(0xFFFBF5F6),
                ],
              ),
            ):BoxDecoration(),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 7,
                        trackShape: CustomTrackShape(),
                      ),
                      child: Slider(
                        value: _currentSliderValue,
                        max: 100,
                        activeColor: Color(0xFFFF677D),
                        inactiveColor: Colors.black12,
                        divisions: 100,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                  ),
              ),
          selectTabIndex == 2
              ? Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 10),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              filterController.setHeadChin(1);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/ic_resize.png',
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(height: 7,),
                                Text(
                                  "Resize",
                                  style: TextStyle(
                                      color: filterController.headChinCheck == 1
                                          ? Colors.red
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              filterController.setHeadChin(2);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/ic_head.png",
                                  width: 18,
                                  height: 18,
                                ),  SizedBox(height: 7,),
                                Text(
                                  "Head",
                                  style: TextStyle(
                                      color: filterController.headChinCheck == 2
                                          ? Colors.red
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              filterController.setHeadChin(3);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/ic_chin.png',
                                  width: 18,
                                  height: 18,
                                ),  SizedBox(height: 7,),
                                Text(
                                  "Chin",
                                  style: TextStyle(
                                      color: filterController.headChinCheck == 3
                                          ? Colors.red
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              filterController.setHeadChin(4);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/ic_area.png",
                                  width: 18,
                                  height: 18,
                                ),  SizedBox(height: 7,),
                                Text(
                                  "Length",
                                  style: TextStyle(
                                      color: filterController.headChinCheck == 4
                                          ? Colors.red
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              filterController.setHeadChin(5);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/ic_width.png',
                                  width: 18,
                                  height: 18,
                                ),  SizedBox(height: 7,),
                                Text(
                                  "Width",
                                  style: TextStyle(
                                      color: filterController.headChinCheck == 5
                                          ? Colors.red
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              filterController.setHeadChin(6);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/ic_cheek.png',
                                  width: 18,
                                  height: 18,
                                ),  SizedBox(height: 7,),
                                Text(
                                  "Cheek",
                                  style: TextStyle(
                                      color: filterController.headChinCheck == 6
                                          ? Colors.red
                                          : Colors.black),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                )
              : Text(''),

          selectTabIndex == 3
              ? Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top: 10),
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    filterController.noseReshape(1);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/ic_resize.png',
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(height: 7,),
                      Text(
                        "Resize",
                        style: TextStyle(
                            color: filterController.noseReshape == 1
                                ? Colors.red
                                : Colors.black),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    filterController.noseReshape(2);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/ic_head.png",
                        width: 18,
                        height: 18,
                      ),  SizedBox(height: 7,),
                      Text(
                        "Narrow",
                        style: TextStyle(
                            color: filterController.noseReshape == 2
                                ? Colors.red
                                : Colors.black),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    filterController.noseReshape(3);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/ic_chin.png',
                        width: 18,
                        height: 18,
                      ),  SizedBox(height: 7,),
                      Text(
                        "Length",
                        style: TextStyle(
                            color: filterController.noseReshape == 3
                                ? Colors.red
                                : Colors.black),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    filterController.setNoseReshape(4);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/ic_area.png",
                        width: 18,
                        height: 18,
                      ),  SizedBox(height: 7,),
                      Text(
                        "Radix Nasy",
                        style: TextStyle(
                            color: filterController.noseReshape == 4
                                ? Colors.red
                                : Colors.black),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    filterController.setNoseReshape(5);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/ic_width.png',
                        width: 18,
                        height: 18,
                      ),  SizedBox(height: 7,),
                      Text(
                        "Nose tip",
                        style: TextStyle(
                            color: filterController.noseReshape == 5
                                ? Colors.red
                                : Colors.black),
                      )
                    ],
                  ),
                ),

              ],
            )),
          )
              : Text(''),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.red),
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_return_sharp),
            label: "Return",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_filter.png',
              width: 18,
              height: 18,
            ),
            label: "Smoother",
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_lip.png',
                width: 18,
                height: 18,
              ),
              label: "Face Reshape"),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_face.png',
                width: 18,
                height: 18,
              ),
              label: "Nose Reshape"),

          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/weight_loss.png',
                width: 17,
                height: 17,
              ),
              label: "Spot"),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
