import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:uber_ui/public/public.dart';

class ProfileOption extends StatelessWidget {
  ProfileOption(
      {Key? key, required this.ontap, required this.icon, required this.text})
      : super(key: key);
  String text;
  IconData icon;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: grey2),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Icon(icon),
                SizedBox(
                  height: 10,
                ),
                Text(text,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
