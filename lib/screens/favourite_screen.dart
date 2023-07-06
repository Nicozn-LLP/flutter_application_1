import 'package:flutter/material.dart';

import '../itrm_details.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name: '',
    ));

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0, top: 20),
              child: Text(
                'My Favourites!',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold, // Make the text bold
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: items,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
