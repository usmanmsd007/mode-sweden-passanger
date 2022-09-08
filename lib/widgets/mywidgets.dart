import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/pickupcontroller.dart';
import 'package:uber_ui/public/public.dart';

import '../controller/home_screen_controller.dart';

// the below widgets are used in home_screen

// this is a list tile and this is used as  buttons
class MyListTile extends StatelessWidget {
  MyListTile({
    required this.icon,
    required this.onpress,
    required this.text,
    Key? key,
  }) : super(key: key);
  VoidCallback onpress;
  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: ListTile(
        onTap: onpress,
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          text,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
        ),
        trailing: Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}

class WhereToGo extends StatelessWidget {
  WhereToGo({
    required this.onNowTap,
    required this.onTextFieldTap,
    Key? key,
  }) : super(key: key);
  VoidCallback onNowTap;
  VoidCallback onTextFieldTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      showCursor: false,
      onTap: onTextFieldTap,
      decoration: InputDecoration(
        hintText: "Where to?",
        hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: InkWell(
              onTap: onNowTap,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.watch_later,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    Text(
                      'Now',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 30,
        ),
        prefixIconColor: Colors.black,
        border: OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.grey.shade300,
      ),
    );
  }
}

// this is my  appbar
class ModeAppbar extends StatelessWidget implements PreferredSizeWidget {
  ModeAppbar({Key? key, this.title = '', this.leading = true})
      : super(key: key);
  String title;
  bool leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: white,
      leading: leading
          ? InkWell(
              child: Icon(
                Icons.arrow_back,
                color: black,
              ),
              onTap: () => Get.back(),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: black,
        ),
      ),
      backgroundColor: yellow,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
//  below are some floating action buttons used in two or three screens

class Smallfab extends StatelessWidget {
  Smallfab({
    required this.onpress,
    Key? key,
  }) : super(key: key);
  VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: blue,
      onPressed: onpress,
      child: const Icon(Icons.arrow_forward),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class MyFAB extends StatelessWidget {
  MyFAB({
    Key? key,
    this.color = Colors.blue,
    required this.text,
    required this.onpress,
  }) : super(key: key);
  VoidCallback onpress;
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black38,
              ),
            ),
          ),
          InkWell(
            onTap: onpress,
            child: Container(
              // alignment: Alii,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// These are authentication buttons used for google and facebook auth.
class AuthButton extends StatelessWidget {
  AuthButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onpress,
  }) : super(key: key);
  String text, icon;
  Function onpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () => onpress,
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  icon,
                  width: 35,
                  height: 35,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}
//below are some of the text widgets that i use randomly

class HeadingText1 extends StatelessWidget {
  HeadingText1({
    required this.text,
    required this.color,
    Key? key,
  }) : super(key: key);
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, color: color),
      overflow: TextOverflow.clip,
    );
  }
}

class TitleText extends StatelessWidget {
  TitleText({
    this.weight = FontWeight.normal,
    required this.text,
    this.color = Colors.black,
    Key? key,
  }) : super(key: key);
  FontWeight weight;
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (TextStyle(color: color, fontSize: 20, fontWeight: weight)),
    );
  }
}
//below is a textfield

class MyTextField extends StatelessWidget {
  MyTextField({
    required this.ctrl,
    required this.hint,
    this.isPassowrd = false,
    Key? key,
  }) : super(key: key);
  String hint;
  TextEditingController ctrl;
  bool isPassowrd;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 13,
      width: Get.width - 40,
      child: TextFormField(
        controller: ctrl,
        cursorColor: Colors.black,
        cursorWidth: 1.0,
        obscureText: isPassowrd,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          fillColor: Colors.grey.shade300,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

// below is a button used
// this is the main button
class MainButton extends StatelessWidget {
  MainButton(
      {Key? key,
      this.hasborder = false,
      this.hasIcon = false,
      required this.color,
      required this.onpress,
      required this.text})
      : super(key: key);
  String text;
  Color color;
  bool hasIcon;
  bool hasborder;
  VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            border: hasborder
                ? Border.all(
                    color: black,
                    width: 1,
                  )
                : null),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                text,
                style: TextStyle(
                    color: white, fontSize: 22, fontWeight: FontWeight.w400),
              ),
              if (hasIcon)
                Icon(
                  Icons.arrow_forward,
                  color: white,
                )
              else
                Container(),
              //  Icon(hasIcon?Icons.arrow_forward:null) ,
            ],
          ),
        ),
      ),
    );
  }
}
// the follwing widgets are used in pickuppoint

// this is the whole top widget of pickuppoint

class CustomTimeline extends StatelessWidget {
  const CustomTimeline({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  final PickUpController ctrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(05.0),
          child: Obx(
            () => Container(
              height: Get.height / 14,
              width: 2,
              color:
                  ctrl.timelineIcon.value ? Colors.grey.shade700 : Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Obx(
            () => ctrl.timelineIcon.value
                ? const Icon(
                    Icons.square,
                    size: 10,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.circle,
                    size: 8,
                    color: Colors.grey.shade700,
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Obx(
            () => ctrl.timelineIcon.value
                ? Icon(
                    Icons.circle,
                    size: 8,
                    color: Colors.grey.shade700,
                  )
                : const Icon(
                    Icons.square,
                    size: 10,
                    color: Colors.black,
                  ),
          ),
        ),
      ],
    );
  }
}

// this is a textfield used for pickuppoint screen and others
