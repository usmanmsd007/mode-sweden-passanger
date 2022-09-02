import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstSearchBox extends StatelessWidget {
  FirstSearchBox({
    required this.ontap,
    required this.text,
    required this.val,
    required this.ctrl,
    required this.suffixontap,
    required this.focusNode,
    required this.onChange,
    Key? key,
  }) : super(key: key);
  VoidCallback suffixontap;
  VoidCallback ontap;

  TextEditingController ctrl;
  FocusNode focusNode;

  final void Function(String) onChange;
  String text;
  bool val;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 18,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextFormField(
          style: TextStyle(overflow: TextOverflow.fade),

          focusNode: focusNode,
          controller: ctrl,
          onChanged: (String s) {
            onChange(s);
          },
          onTap: ontap,

          // maxLines: 2,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              suffixIcon: ctrl.text.isEmpty
                  ? Icon(Icons.close, color: Colors.grey)
                  : InkWell(
                      onTap: suffixontap,
                      child: Icon(Icons.close, color: Colors.blue))
              // fillColor: Colors.grey, filled: true
              ),
        ),
      ),
    );
  }
}

class SecondSearchBox extends StatelessWidget {
  SecondSearchBox({
    required this.ontap,
    required this.text,
    required this.val,
    required this.ctrl,
    // required this.enabled,
    required this.suffixontap,
    required this.focusNode,
    required this.onChange,
    Key? key,
  }) : super(key: key);
  VoidCallback suffixontap;
  VoidCallback ontap;
  // bool enabled;

  TextEditingController ctrl;
  FocusNode focusNode;

  final void Function(String) onChange;
  String text;
  bool val;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 18,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextFormField(
          style: TextStyle(overflow: TextOverflow.fade),
          focusNode: focusNode,
          controller: ctrl,
          onChanged: (String s) {
            onChange(s);
          },
          // enabled: enabled,
          onTap: ontap,

          // maxLines: 2,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              suffixIcon: ctrl.text.isEmpty
                  ? Icon(Icons.close, color: Colors.grey)
                  : InkWell(
                      onTap: suffixontap,
                      child: Icon(Icons.close, color: Colors.blue))
              // fillColor: Colors.grey, filled: true
              ),
        ),
      ),
    );
  }
}
