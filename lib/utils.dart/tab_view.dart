import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils.dart/searching_bar.dart';

import '../screens/accessories_screen.dart';
import '../screens/fashion_screen.dart';
import '../screens/featured_screen.dart';
import '../screens/vehicles_screen.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with TickerProviderStateMixin {
  late TabController _tabController;
  // ignore: unused_field
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(0);
  }

//   static  List<Tab> _tab1 = [
//     Tab(child: Text('Service Ranking', style: TextStyle(color: Colors.black),)),
//     Tab(child: Text('Sales Ranking', style: TextStyle(color: Colors.black),)),
//     Tab(child: Text('Tab 4', style: TextStyle(color: Colors.black),)),
//   ];
//   static const List<Tab> _tab2 = [
//   Tab(child: Text('Featured', style: TextStyle(color: Colors.black),))];
//
//
//
//   static  List<Widget> _view1 = [
//
//     const Center(child: const Text('Content of Tab Two')),
//     const Center(child: const Text('Content of Tab Three')),
//     const Center(child: const Text('Content of Tab Four')),
//
//   ];
//   static const List<Widget> _view2 = [
//   const Featured(),
// ];
  @override
  Widget build(BuildContext context) {
    Map<Tab, Widget> map = {
      Tab(
          child: Text(
        'Vehicles',
        style: TextStyle(color: Colors.black),
      )): VehiclesScreen(),
      Tab(
          child: Text(
        'Fashion',
        style: TextStyle(color: Colors.black),
      )): FashionScreen(),
      Tab(
          child: Text(
        'Accessories',
        style: TextStyle(color: Colors.black),
      )): AccessoriesScreen()
    };

    List<TabClass> tabClass = [];
    map.entries.forEach((e) => tabClass.add(TabClass(e.key, e.value)));
    tabClass.shuffle();

    var map1 =
        Map.fromIterable(tabClass, key: (e) => e.tab, value: (e) => e.widget);

    List<Tab> _tabs = [
      Tab(
          child: Text(
        'Featured',
        style: TextStyle(color: Colors.black),
      ))
    ];

    List<Widget> _values = [FeaturedScreen()];
    map1.keys.forEach((key) {
      _tabs.add(key);
    });
    map1.values.forEach((element) {
      _values.add(element);
    });

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 120,
              pinned: true,
              floating: true,
              snap: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TabBar(
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                  unselectedLabelStyle:
                      const TextStyle(color: Colors.black, fontSize: 15),
                  indicatorWeight: 10,
                  // indicatorColor: Colors.red,
                  // indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.all(5),
                  indicator: BoxDecoration(
                    border: Border.all(color: Color(0x000)),
                    borderRadius: BorderRadius.circular(00),
                    color: Colors.white,
                  ),
                  isScrollable: true,
                  physics: BouncingScrollPhysics(),
                  onTap: (int index) {
                    //  print('Tab $index is tapped');
                  },
                  enableFeedback: true,
                  // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
                  // controller: _tabController,
                  tabs: _tabs,
                  controller: _tabController,
                ),
              ),
              flexibleSpace: SearchingBar(),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: BouncingScrollPhysics(),
          // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
          // controller: _tabController,
          children: _values,
        ),
      ),
    );
  }
}

class TabClass {
  Tab tab;
  Widget widget;
  TabClass(this.tab, this.widget);
  @override
  String toString() {
    return '{${this.tab},${this.widget}';
  }
}
