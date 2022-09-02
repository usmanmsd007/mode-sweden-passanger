import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../public/public.dart';

class AddTrustedContact extends StatelessWidget {
  const AddTrustedContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: black,
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  arrow_back,
                  color: white,
                ),
              ),
              expandedHeight: Get.height / 8,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'Add Trusted Contact',
                  style: TextStyle(color: white),
                ),
              ),
              pinned: true,
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: 'Find Contacts',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                ))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            40,
                            (index) => ListTile(
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue,
                                child: Text(
                                  'U',
                                  style: TextStyle(color: white, fontSize: 22),
                                ),
                              ),
                              title: Text('Usman Khan'),
                              subtitle: Text("030693929$index"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
