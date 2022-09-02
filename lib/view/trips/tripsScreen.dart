import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../public/public.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: yellow,
            leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                arrow_back,
                color: Colors.black,
              ),
            ),
            expandedHeight: Get.height / 8,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Choose a trip',
                style: TextStyle(color: black),
              ),
            ),
            pinned: true,
          ),
          SliverFillRemaining(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('You haven\'t taken a trip yet.'),
              ],
            )),
          )
        ],
      ),
    ));
  }
}
