import 'package:flutter/material.dart';

import '../itrm_details.dart';

class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://images.pexels.com/photos/339379/pexels-photo-339379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      name: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://images.pexels.com/photos/339379/pexels-photo-339379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLxSkwhfRx5n1mZP1EgH04eqfpBgFqjy4B-w&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu550bxZtiD_tkCLgKT0Lib_Xr80A5a0U-zw&usqp=CAU',
      name: '',
    ));

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: items,
        ));
  }
}
