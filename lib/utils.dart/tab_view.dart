import 'package:flutter/material.dart';
import 'package:renttt/screens/accessories_screen.dart';
import 'package:renttt/screens/fashion_screen.dart';
import 'package:renttt/screens/featured_screen.dart';
import 'package:renttt/screens/vehicles_screen.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60, // Adjust tab bar height
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
                insets: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              tabs: [
                Tab(
                  child: Text(
                    'Featured',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    'Vehicles',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    'Fashion',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    'Accs',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FeaturedScreen(),
                VehiclesScreen(),
                FashionScreen(),
                AccessoriesScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
