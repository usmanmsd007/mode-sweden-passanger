import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class Security_Screen extends StatelessWidget {
  const Security_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ModeAppbar(
        leading: true,
        title: 'Security',
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height / 10,
                ),
                const Divider(),
                ListTile(
                  title: const Text('2-step verification'),
                  trailing: Text(
                    'Unavailable',
                    style: TextStyle(color: grey5),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Unfortunately, 2-step verification is unavailable at the moment',
                    style: TextStyle(color: grey5),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
