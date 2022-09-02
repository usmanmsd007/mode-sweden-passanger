import 'package:flutter/material.dart';
import 'package:uber_ui/public/public.dart';

class WhatToSendButton extends StatelessWidget {
  WhatToSendButton({
    required this.onpress,
    Key? key,
  }) : super(key: key);
  VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: yellow, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(
                  Icons.info,
                ),
                Text(
                  'What to send',
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
