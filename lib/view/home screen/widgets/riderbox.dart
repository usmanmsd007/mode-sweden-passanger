import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideBox extends StatelessWidget {
  RideBox({
    required this.pathtoicon,
    required this.text,
    required this.ontap,
    Key? key,
  }) : super(key: key);
  String text;
  VoidCallback ontap;
  String pathtoicon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: Get.width / 2.3,
        height: Get.height / 6,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Image.asset(
                      pathtoicon,
                      height: 75,
                      width: 75,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
