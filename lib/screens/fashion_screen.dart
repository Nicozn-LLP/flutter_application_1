import 'package:flutter/material.dart';

import '../itrm_details.dart';

class FashionScreen extends StatelessWidget {
  const FashionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name: '',
    ));

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: items,
        ));
  }
}
