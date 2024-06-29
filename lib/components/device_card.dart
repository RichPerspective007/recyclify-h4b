import 'package:flutter/material.dart';
import 'package:recyclify/models/device_categories.dart';
import 'package:recyclify/pages/device_details.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.device
    });

    final Devices device;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceDetailslForm(device: device)));
      },
      child: Card(
        elevation: 2.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: (){},
              
              child: Container(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0)
                  ),
                  child: Image.asset(device.imgUrl),
                ),
              ),
            ),
            ListTile(
              title: Text(device.type, style: Theme.of(context).textTheme.titleMedium,),
              titleAlignment: ListTileTitleAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}