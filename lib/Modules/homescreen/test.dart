import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Dynamic title based on the current tab index
        title: Text(tabController.index == 0
            ? 'one'
            : tabController.index == 1
                ? 'two'
                : tabController.index == 2
                    ? 'three'
                    : 'four'),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              text: 'one',
              icon: Icon(Icons.home, color: Colors.indigo.shade500),
            ),
            Tab(
              text: 'two',
              icon: Icon(Icons.email, color: Colors.indigo.shade500),
            ),
            Tab(
              text: 'three',
              icon: Icon(Icons.star, color: Colors.indigo.shade500),
            ),
            Tab(
              text: 'four',
              icon: Icon(Icons.person, color: Colors.indigo.shade500),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          FirstScreen(tabController: tabController),
          SecondScreen(tabController: tabController),
          ThirdScreen(tabController: tabController),
          FourthScreen(tabController: tabController),
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final TabController tabController;
  const FirstScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('First Screen'));
  }
}

class SecondScreen extends StatelessWidget {
  final TabController tabController;
  const SecondScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Second Screen'));
  }
}

class ThirdScreen extends StatelessWidget {
  final TabController tabController;
  const ThirdScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Third Screen'));
  }
}

class FourthScreen extends StatelessWidget {
  final TabController tabController;
  const FourthScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Fourth Screen'));
  }
}
