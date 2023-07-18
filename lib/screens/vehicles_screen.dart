import 'package:flutter/material.dart';
import 'package:flutter_application_1/itrm_details.dart';


class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLxSkwhfRx5n1mZP1EgH04eqfpBgFqjy4B-w&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu550bxZtiD_tkCLgKT0Lib_Xr80A5a0U-zw&usqp=CAU',
      name1: '',
      name2: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLxSkwhfRx5n1mZP1EgH04eqfpBgFqjy4B-w&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu550bxZtiD_tkCLgKT0Lib_Xr80A5a0U-zw&usqp=CAU',
      name1: '',
      name2: '',
    ));
    items.add(ItemContainer(
      imageUrl1:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLxSkwhfRx5n1mZP1EgH04eqfpBgFqjy4B-w&usqp=CAU',
      imageUrl2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu550bxZtiD_tkCLgKT0Lib_Xr80A5a0U-zw&usqp=CAU',
      name1: '',
      name2: '',
    ));

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
            child: Column(
          children: items,
        )));
  }
}
