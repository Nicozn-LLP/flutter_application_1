import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/styles.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                  ),
                  child: const Icon(Icons.arrow_back),
                ),
                SizedBox(width: 10),
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
