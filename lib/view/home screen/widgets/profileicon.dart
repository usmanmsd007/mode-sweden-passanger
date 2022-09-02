import 'package:flutter/material.dart';
import 'package:uber_ui/public/public.dart';

class ProfileIcon extends StatelessWidget {
  ProfileIcon({
    required this.ontap,
    this.size = 25,
    Key? key,
  }) : super(key: key);
  double size;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
        child: CircleAvatar(
          radius: size,
          backgroundColor: grey2,
          child: Icon(
            Icons.person,
            color: black,
            size: 35,
          ),
        ),
      ),
    );
  }
}
