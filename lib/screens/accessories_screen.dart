import 'package:flutter/material.dart';

import '../itrm_details.dart';

class AccessoriesScreen extends StatelessWidget {
  const AccessoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    items.add(ItemContainer(
      imageUrl1:
          'https://images.pexels.com/photos/339379/pexels-photo-339379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      imageUrl2:
          'https://images.pexels.com/photos/339379/pexels-photo-339379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      name: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://images.pexels.com/photos/339379/pexels-photo-339379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      imageUrl2:
          'https://images.pexels.com/photos/339379/pexels-photo-339379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      name: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://images.pexels.com/photos/339379/pexels-photo-339379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      imageUrl2:
          'https://images.pexels.com/photos/339379/pexels-photo-339379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      name: '',
    ));

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: items,
        ));
  }
}
