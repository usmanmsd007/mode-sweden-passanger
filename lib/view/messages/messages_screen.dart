import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../public/public.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: yellow,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                arrow_back,
                color: black,
              ),
            ),
            expandedHeight: Get.height / 8,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Messages',
                style: TextStyle(color: black),
              ),
            ),
            pinned: true,
          ),
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Icon(
                    Icons.gpp_good_sharp,
                    color: Colors.green,
                    size: 75,
                  ),
                ),
                Text(
                  'You\'re all up to date.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Text(
                    'No new messages available at the moment. Come back soon to discover new offers!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
