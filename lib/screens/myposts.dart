import 'package:flutter/material.dart';

import '../itrm_details.dart';

class Myposts extends StatelessWidget {
  const Myposts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name1: '',
      name2: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name1: '',
      name2: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name1: '',
      name2: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU',
      name1: '',
      name2: '',
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Row(
              children: [
                SizedBox(width: 120),
                Text(
                  'My Posts!',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
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
    );
  }
}
