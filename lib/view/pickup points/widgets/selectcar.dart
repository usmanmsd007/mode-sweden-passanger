import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCar extends StatelessWidget {
  final Function()? onTap;
  const SelectCar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Get.width * 0.03),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.bus_alert),
            title: const Text('Basic'),
            trailing: Text('fare'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.bus_alert),
            title: const Text('Basic'),
            trailing: Text('fare'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.bus_alert),
            title: const Text('Basic'),
            trailing: Text('fare'),
          ),
          DropdownButton(
              value: 'Cash',
              items: [DropdownMenuItem(value: 'Cash', child: Text('Cash'))],
              onChanged: (value) {}),
          Center(
            child:
                ElevatedButton(onPressed: onTap, child: const Text('Confirm')),
          )
        ],
      ),
    );
  }
}
